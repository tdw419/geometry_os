; DESCRIPTION: Draws a orange line from (160, 181) to (243, 126).
; PLAN: r0=160(x1), r1=181(y1), r2=243(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 181
LDI r2, 243
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
