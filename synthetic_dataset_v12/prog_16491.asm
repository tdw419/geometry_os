; DESCRIPTION: Draws a blue line from (261, 144) to (304, 178).
; PLAN: r0=261(x1), r1=144(y1), r2=304(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 144
LDI r2, 304
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
