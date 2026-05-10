; DESCRIPTION: Places a black line segment connecting (401, 192) to (395, 193).
; PLAN: r0=401(x1), r1=192(y1), r2=395(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 192
LDI r2, 395
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
