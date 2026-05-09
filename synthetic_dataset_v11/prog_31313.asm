; DESCRIPTION: Draws a orange line from (209, 243) to (148, 55).
; PLAN: r0=209(x1), r1=243(y1), r2=148(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 243
LDI r2, 148
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
