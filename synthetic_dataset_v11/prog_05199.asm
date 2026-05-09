; DESCRIPTION: Places a black line segment connecting (193, 66) to (65, 83).
; PLAN: r0=193(x1), r1=66(y1), r2=65(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 66
LDI r2, 65
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
