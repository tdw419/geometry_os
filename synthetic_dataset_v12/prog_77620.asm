; DESCRIPTION: Draws a magenta line from (320, 205) to (49, 74).
; PLAN: r0=320(x1), r1=205(y1), r2=49(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 205
LDI r2, 49
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
