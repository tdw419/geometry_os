; DESCRIPTION: Renders a orange line between points (146, 205) and (229, 238).
; PLAN: r0=146(x1), r1=205(y1), r2=229(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 205
LDI r2, 229
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
