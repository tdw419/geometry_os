; DESCRIPTION: Places a black line segment connecting (68, 126) to (218, 86).
; PLAN: r0=68(x1), r1=126(y1), r2=218(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 126
LDI r2, 218
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
