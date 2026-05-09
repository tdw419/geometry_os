; DESCRIPTION: Draws a magenta line from (239, 83) to (163, 132).
; PLAN: r0=239(x1), r1=83(y1), r2=163(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 83
LDI r2, 163
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
