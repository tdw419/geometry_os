; DESCRIPTION: Renders a purple line between points (298, 198) and (310, 210).
; PLAN: r0=298(x1), r1=198(y1), r2=310(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 198
LDI r2, 310
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
