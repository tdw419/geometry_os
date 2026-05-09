; DESCRIPTION: Places a white line segment connecting (71, 180) to (18, 195).
; PLAN: r0=71(x1), r1=180(y1), r2=18(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 180
LDI r2, 18
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
