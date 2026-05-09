; DESCRIPTION: Draws a orange line from (118, 210) to (243, 244).
; PLAN: r0=118(x1), r1=210(y1), r2=243(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 210
LDI r2, 243
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
