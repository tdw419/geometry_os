; DESCRIPTION: Draws a red line from (462, 154) to (440, 155).
; PLAN: r0=462(x1), r1=154(y1), r2=440(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 154
LDI r2, 440
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
