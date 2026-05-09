; DESCRIPTION: Places a yellow 49x20 rectangle at position (10, 235).
; PLAN: r0=10(x), r1=235(y), r2=49(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 235
LDI r2, 49
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
