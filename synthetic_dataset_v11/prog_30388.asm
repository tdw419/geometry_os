; DESCRIPTION: Draws a black line from (150, 165) to (181, 222).
; PLAN: r0=150(x1), r1=165(y1), r2=181(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 165
LDI r2, 181
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
