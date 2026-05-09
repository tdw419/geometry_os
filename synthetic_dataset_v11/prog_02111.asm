; DESCRIPTION: Places a orange line segment connecting (225, 243) to (65, 19).
; PLAN: r0=225(x1), r1=243(y1), r2=65(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 243
LDI r2, 65
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
