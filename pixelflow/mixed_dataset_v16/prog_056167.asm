; DESCRIPTION: Places a yellow 38x10 rectangle at position (354, 235).
; PLAN: r0=354(x), r1=235(y), r2=38(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 235
LDI r2, 38
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
