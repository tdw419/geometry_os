; DESCRIPTION: Draws a magenta line from (274, 126) to (10, 209).
; PLAN: r0=274(x1), r1=126(y1), r2=10(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 126
LDI r2, 10
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
