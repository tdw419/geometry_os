; DESCRIPTION: Renders a magenta line between points (413, 14) and (379, 86).
; PLAN: r0=413(x1), r1=14(y1), r2=379(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 14
LDI r2, 379
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
