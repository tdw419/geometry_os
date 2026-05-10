; DESCRIPTION: Draws a white line from (462, 164) to (396, 43).
; PLAN: r0=462(x1), r1=164(y1), r2=396(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 164
LDI r2, 396
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
