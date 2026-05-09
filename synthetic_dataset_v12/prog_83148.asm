; DESCRIPTION: Places a purple line segment connecting (298, 35) to (127, 43).
; PLAN: r0=298(x1), r1=35(y1), r2=127(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 35
LDI r2, 127
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
