; DESCRIPTION: Renders a orange line between points (357, 206) and (31, 146).
; PLAN: r0=357(x1), r1=206(y1), r2=31(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 206
LDI r2, 31
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
