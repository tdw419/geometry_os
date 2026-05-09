; DESCRIPTION: Renders a magenta line between points (288, 60) and (255, 22).
; PLAN: r0=288(x1), r1=60(y1), r2=255(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 60
LDI r2, 255
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
