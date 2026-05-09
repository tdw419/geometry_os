; DESCRIPTION: Places a black line segment connecting (265, 3) to (401, 230).
; PLAN: r0=265(x1), r1=3(y1), r2=401(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 3
LDI r2, 401
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
