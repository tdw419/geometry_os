; DESCRIPTION: Draws a orange line from (479, 172) to (312, 74).
; PLAN: r0=479(x1), r1=172(y1), r2=312(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 172
LDI r2, 312
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
