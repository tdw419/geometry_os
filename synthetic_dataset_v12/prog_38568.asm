; DESCRIPTION: Places a yellow 112x17 rectangle at position (85, 235).
; PLAN: r0=85(x), r1=235(y), r2=112(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 235
LDI r2, 112
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
