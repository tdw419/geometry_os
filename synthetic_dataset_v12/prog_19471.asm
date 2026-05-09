; DESCRIPTION: Draws a blue line from (301, 173) to (370, 102).
; PLAN: r0=301(x1), r1=173(y1), r2=370(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 173
LDI r2, 370
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
