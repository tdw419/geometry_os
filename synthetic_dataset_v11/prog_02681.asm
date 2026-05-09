; DESCRIPTION: Renders a orange line between points (153, 226) and (25, 210).
; PLAN: r0=153(x1), r1=226(y1), r2=25(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 226
LDI r2, 25
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
