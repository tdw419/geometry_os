; DESCRIPTION: Draws a magenta line from (224, 31) to (309, 17).
; PLAN: r0=224(x1), r1=31(y1), r2=309(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 31
LDI r2, 309
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
