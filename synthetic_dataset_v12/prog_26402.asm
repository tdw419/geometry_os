; DESCRIPTION: Places a black line segment connecting (10, 73) to (401, 121).
; PLAN: r0=10(x1), r1=73(y1), r2=401(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 73
LDI r2, 401
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
