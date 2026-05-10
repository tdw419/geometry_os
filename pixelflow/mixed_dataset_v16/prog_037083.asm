; DESCRIPTION: Draws a black line from (188, 121) to (292, 239).
; PLAN: r0=188(x1), r1=121(y1), r2=292(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 121
LDI r2, 292
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
