; DESCRIPTION: Renders a magenta line between points (223, 164) and (178, 122).
; PLAN: r0=223(x1), r1=164(y1), r2=178(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 164
LDI r2, 178
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
