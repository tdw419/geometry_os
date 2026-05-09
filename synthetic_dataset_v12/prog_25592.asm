; DESCRIPTION: Draws a magenta line from (239, 184) to (370, 23).
; PLAN: r0=239(x1), r1=184(y1), r2=370(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 184
LDI r2, 370
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
