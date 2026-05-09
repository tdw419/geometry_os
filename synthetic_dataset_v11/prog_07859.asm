; DESCRIPTION: Renders a magenta line between points (254, 164) and (31, 95).
; PLAN: r0=254(x1), r1=164(y1), r2=31(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 164
LDI r2, 31
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
