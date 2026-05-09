; DESCRIPTION: Draws a white line from (108, 100) to (193, 167).
; PLAN: r0=108(x1), r1=100(y1), r2=193(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 100
LDI r2, 193
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
