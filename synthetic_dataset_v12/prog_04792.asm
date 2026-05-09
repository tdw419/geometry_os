; DESCRIPTION: Draws a magenta line from (224, 12) to (61, 76).
; PLAN: r0=224(x1), r1=12(y1), r2=61(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 12
LDI r2, 61
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
