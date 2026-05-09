; DESCRIPTION: Renders a yellow box of size 26x87 starting at (47, 85).
; PLAN: r0=47(x), r1=85(y), r2=26(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 85
LDI r2, 26
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
