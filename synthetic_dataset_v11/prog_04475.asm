; DESCRIPTION: Draws a black line from (20, 68) to (3, 167).
; PLAN: r0=20(x1), r1=68(y1), r2=3(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 68
LDI r2, 3
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
