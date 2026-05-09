; DESCRIPTION: Draws a magenta line from (306, 205) to (143, 224).
; PLAN: r0=306(x1), r1=205(y1), r2=143(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 205
LDI r2, 143
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
