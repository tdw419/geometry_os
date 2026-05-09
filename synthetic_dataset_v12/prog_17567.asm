; DESCRIPTION: Renders a green line between points (332, 21) and (175, 12).
; PLAN: r0=332(x1), r1=21(y1), r2=175(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 21
LDI r2, 175
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
