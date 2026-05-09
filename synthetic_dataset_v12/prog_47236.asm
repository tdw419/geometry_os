; DESCRIPTION: Places a white line segment connecting (436, 49) to (298, 105).
; PLAN: r0=436(x1), r1=49(y1), r2=298(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 49
LDI r2, 298
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
