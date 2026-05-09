; DESCRIPTION: Draws a magenta line from (244, 237) to (135, 139).
; PLAN: r0=244(x1), r1=237(y1), r2=135(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 237
LDI r2, 135
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
