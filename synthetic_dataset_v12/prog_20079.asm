; DESCRIPTION: Draws a green line from (106, 232) to (61, 255).
; PLAN: r0=106(x1), r1=232(y1), r2=61(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 232
LDI r2, 61
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
