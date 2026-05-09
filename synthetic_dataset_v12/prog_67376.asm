; DESCRIPTION: Renders a purple line between points (332, 119) and (239, 210).
; PLAN: r0=332(x1), r1=119(y1), r2=239(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 119
LDI r2, 239
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
