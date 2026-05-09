; DESCRIPTION: Draws a magenta line from (225, 70) to (255, 212).
; PLAN: r0=225(x1), r1=70(y1), r2=255(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 70
LDI r2, 255
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
