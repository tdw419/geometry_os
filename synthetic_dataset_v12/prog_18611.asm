; DESCRIPTION: Draws a magenta line from (320, 3) to (395, 58).
; PLAN: r0=320(x1), r1=3(y1), r2=395(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 3
LDI r2, 395
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
