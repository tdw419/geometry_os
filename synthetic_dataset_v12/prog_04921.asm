; DESCRIPTION: Draws a orange line from (171, 151) to (210, 69).
; PLAN: r0=171(x1), r1=151(y1), r2=210(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 151
LDI r2, 210
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
