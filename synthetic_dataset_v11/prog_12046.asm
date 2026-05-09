; DESCRIPTION: Draws a magenta line from (54, 108) to (171, 184).
; PLAN: r0=54(x1), r1=108(y1), r2=171(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 108
LDI r2, 171
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
