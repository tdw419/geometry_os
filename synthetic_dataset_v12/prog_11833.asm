; DESCRIPTION: Draws a black line from (311, 214) to (50, 62).
; PLAN: r0=311(x1), r1=214(y1), r2=50(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 214
LDI r2, 50
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
