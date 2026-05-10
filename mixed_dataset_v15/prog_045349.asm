; DESCRIPTION: Places a white line segment connecting (171, 19) to (68, 71).
; PLAN: r0=171(x1), r1=19(y1), r2=68(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 19
LDI r2, 68
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
