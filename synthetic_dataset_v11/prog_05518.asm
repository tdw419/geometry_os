; DESCRIPTION: Draws a magenta line from (36, 228) to (224, 130).
; PLAN: r0=36(x1), r1=228(y1), r2=224(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 228
LDI r2, 224
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
