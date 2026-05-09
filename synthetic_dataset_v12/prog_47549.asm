; DESCRIPTION: Renders a orange line between points (305, 156) and (295, 167).
; PLAN: r0=305(x1), r1=156(y1), r2=295(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 156
LDI r2, 295
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
