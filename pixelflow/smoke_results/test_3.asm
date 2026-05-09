; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).
; PLAN: r0=4151(x), r1=104(y), r2=101(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 151
LDI r2, 42
LDI r3, 10140
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT