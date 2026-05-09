; DESCRIPTION: Draws a magenta line from (431, 154) to (239, 4).
; PLAN: r0=431(x1), r1=154(y1), r2=239(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 154
LDI r2, 239
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
