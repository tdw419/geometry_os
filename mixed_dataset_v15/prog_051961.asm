; DESCRIPTION: Draws a black line from (463, 68) to (264, 175).
; PLAN: r0=463(x1), r1=68(y1), r2=264(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 68
LDI r2, 264
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
