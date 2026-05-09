; DESCRIPTION: Places a black line segment connecting (21, 111) to (229, 234).
; PLAN: r0=21(x1), r1=111(y1), r2=229(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 111
LDI r2, 229
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
