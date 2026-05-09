; DESCRIPTION: Draws a orange line from (160, 243) to (70, 3).
; PLAN: r0=160(x1), r1=243(y1), r2=70(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 243
LDI r2, 70
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
