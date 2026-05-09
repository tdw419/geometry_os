; DESCRIPTION: Renders a orange line between points (152, 245) and (437, 167).
; PLAN: r0=152(x1), r1=245(y1), r2=437(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 245
LDI r2, 437
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
