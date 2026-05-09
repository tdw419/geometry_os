; DESCRIPTION: Renders a orange line between points (243, 108) and (230, 234).
; PLAN: r0=243(x1), r1=108(y1), r2=230(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 108
LDI r2, 230
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
