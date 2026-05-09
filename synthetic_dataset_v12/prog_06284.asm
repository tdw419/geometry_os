; DESCRIPTION: Draws a orange line from (411, 148) to (161, 113).
; PLAN: r0=411(x1), r1=148(y1), r2=161(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 148
LDI r2, 161
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
