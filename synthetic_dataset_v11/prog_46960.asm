; DESCRIPTION: Draws a magenta line from (253, 123) to (255, 134).
; PLAN: r0=253(x1), r1=123(y1), r2=255(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 123
LDI r2, 255
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
