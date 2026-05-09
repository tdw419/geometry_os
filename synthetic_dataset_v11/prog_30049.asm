; DESCRIPTION: Draws a magenta line from (240, 27) to (100, 175).
; PLAN: r0=240(x1), r1=27(y1), r2=100(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 27
LDI r2, 100
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
