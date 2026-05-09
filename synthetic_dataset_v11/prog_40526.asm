; DESCRIPTION: Draws a magenta line from (28, 255) to (17, 208).
; PLAN: r0=28(x1), r1=255(y1), r2=17(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 255
LDI r2, 17
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
