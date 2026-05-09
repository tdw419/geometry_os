; DESCRIPTION: Renders a orange line between points (202, 97) and (158, 174).
; PLAN: r0=202(x1), r1=97(y1), r2=158(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 97
LDI r2, 158
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
