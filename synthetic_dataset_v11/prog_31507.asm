; DESCRIPTION: Draws a red line from (252, 219) to (220, 141).
; PLAN: r0=252(x1), r1=219(y1), r2=220(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 219
LDI r2, 220
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
