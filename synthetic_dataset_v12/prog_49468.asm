; DESCRIPTION: Draws a magenta line from (241, 184) to (240, 98).
; PLAN: r0=241(x1), r1=184(y1), r2=240(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 184
LDI r2, 240
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
