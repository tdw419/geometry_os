; DESCRIPTION: Draws a yellow line from (105, 50) to (138, 178).
; PLAN: r0=105(x1), r1=50(y1), r2=138(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 50
LDI r2, 138
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
