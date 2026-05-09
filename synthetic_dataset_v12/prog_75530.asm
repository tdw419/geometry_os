; DESCRIPTION: Renders a green box of size 110x117 starting at (133, 127).
; PLAN: r0=133(x), r1=127(y), r2=110(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 127
LDI r2, 110
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
