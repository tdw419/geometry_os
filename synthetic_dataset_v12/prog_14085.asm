; DESCRIPTION: Renders a magenta line between points (491, 192) and (255, 222).
; PLAN: r0=491(x1), r1=192(y1), r2=255(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 192
LDI r2, 255
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
