; DESCRIPTION: Places a black line segment connecting (35, 9) to (146, 221).
; PLAN: r0=35(x1), r1=9(y1), r2=146(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 9
LDI r2, 146
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
