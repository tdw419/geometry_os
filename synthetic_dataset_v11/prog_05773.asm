; DESCRIPTION: Renders a orange line between points (252, 200) and (174, 215).
; PLAN: r0=252(x1), r1=200(y1), r2=174(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 200
LDI r2, 174
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
