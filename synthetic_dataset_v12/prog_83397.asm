; DESCRIPTION: Renders a magenta line between points (108, 255) and (447, 135).
; PLAN: r0=108(x1), r1=255(y1), r2=447(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 255
LDI r2, 447
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
