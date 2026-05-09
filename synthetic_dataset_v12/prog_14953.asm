; DESCRIPTION: Places a white line segment connecting (395, 123) to (352, 171).
; PLAN: r0=395(x1), r1=123(y1), r2=352(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 123
LDI r2, 352
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
