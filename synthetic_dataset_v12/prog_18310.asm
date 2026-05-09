; DESCRIPTION: Renders a green line between points (332, 175) and (44, 86).
; PLAN: r0=332(x1), r1=175(y1), r2=44(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 175
LDI r2, 44
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
