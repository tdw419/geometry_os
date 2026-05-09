; DESCRIPTION: Draws a magenta line from (62, 206) to (241, 244).
; PLAN: r0=62(x1), r1=206(y1), r2=241(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 206
LDI r2, 241
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
