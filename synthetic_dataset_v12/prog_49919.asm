; DESCRIPTION: Places a white line segment connecting (298, 252) to (233, 134).
; PLAN: r0=298(x1), r1=252(y1), r2=233(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 252
LDI r2, 233
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
