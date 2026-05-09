; DESCRIPTION: Draws a orange line from (39, 48) to (54, 70).
; PLAN: r0=39(x1), r1=48(y1), r2=54(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 48
LDI r2, 54
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
