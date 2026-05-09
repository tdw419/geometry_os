; DESCRIPTION: Renders a magenta line between points (320, 222) and (313, 99).
; PLAN: r0=320(x1), r1=222(y1), r2=313(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 222
LDI r2, 313
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
