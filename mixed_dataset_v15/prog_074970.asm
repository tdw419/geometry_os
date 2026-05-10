; DESCRIPTION: Draws a blue line from (122, 108) to (510, 241).
; PLAN: r0=122(x1), r1=108(y1), r2=510(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 108
LDI r2, 510
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
