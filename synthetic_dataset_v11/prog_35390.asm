; DESCRIPTION: Places a black line segment connecting (218, 50) to (7, 71).
; PLAN: r0=218(x1), r1=50(y1), r2=7(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 50
LDI r2, 7
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
