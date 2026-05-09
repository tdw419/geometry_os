; DESCRIPTION: Renders a magenta line between points (156, 4) and (493, 61).
; PLAN: r0=156(x1), r1=4(y1), r2=493(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 4
LDI r2, 493
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
