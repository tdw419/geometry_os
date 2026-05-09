; DESCRIPTION: Draws a orange line from (25, 46) to (29, 164).
; PLAN: r0=25(x1), r1=46(y1), r2=29(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 46
LDI r2, 29
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
