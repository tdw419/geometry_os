; DESCRIPTION: Draws a orange line from (288, 171) to (220, 0).
; PLAN: r0=288(x1), r1=171(y1), r2=220(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 171
LDI r2, 220
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
