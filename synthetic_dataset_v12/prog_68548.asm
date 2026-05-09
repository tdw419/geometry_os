; DESCRIPTION: Draws a magenta line from (320, 49) to (492, 157).
; PLAN: r0=320(x1), r1=49(y1), r2=492(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 49
LDI r2, 492
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
