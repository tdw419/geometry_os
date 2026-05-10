; DESCRIPTION: Draws a magenta line from (111, 108) to (38, 43).
; PLAN: r0=111(x1), r1=108(y1), r2=38(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 108
LDI r2, 38
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
