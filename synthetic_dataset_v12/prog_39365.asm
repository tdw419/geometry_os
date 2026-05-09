; DESCRIPTION: Places a white line segment connecting (298, 249) to (332, 66).
; PLAN: r0=298(x1), r1=249(y1), r2=332(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 249
LDI r2, 332
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
