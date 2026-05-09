; DESCRIPTION: Draws a magenta line from (203, 7) to (379, 143).
; PLAN: r0=203(x1), r1=7(y1), r2=379(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 7
LDI r2, 379
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
