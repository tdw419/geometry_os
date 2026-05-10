; DESCRIPTION: Draws a magenta line from (393, 144) to (416, 183).
; PLAN: r0=393(x1), r1=144(y1), r2=416(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 144
LDI r2, 416
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
