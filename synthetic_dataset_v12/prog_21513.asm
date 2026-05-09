; DESCRIPTION: Places a white line segment connecting (458, 212) to (298, 12).
; PLAN: r0=458(x1), r1=212(y1), r2=298(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 212
LDI r2, 298
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
