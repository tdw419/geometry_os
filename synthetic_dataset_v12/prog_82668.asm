; DESCRIPTION: Places a black line segment connecting (401, 70) to (71, 51).
; PLAN: r0=401(x1), r1=70(y1), r2=71(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 70
LDI r2, 71
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
