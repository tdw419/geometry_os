; DESCRIPTION: Renders a green line between points (222, 7) and (128, 230).
; PLAN: r0=222(x1), r1=7(y1), r2=128(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 7
LDI r2, 128
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
