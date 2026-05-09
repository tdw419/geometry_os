; DESCRIPTION: Renders a green line between points (427, 48) and (240, 222).
; PLAN: r0=427(x1), r1=48(y1), r2=240(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 48
LDI r2, 240
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
