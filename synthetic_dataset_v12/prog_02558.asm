; DESCRIPTION: Draws a blue line from (328, 116) to (127, 144).
; PLAN: r0=328(x1), r1=116(y1), r2=127(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 116
LDI r2, 127
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
