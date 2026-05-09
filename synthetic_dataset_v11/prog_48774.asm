; DESCRIPTION: Renders a magenta line between points (79, 220) and (64, 5).
; PLAN: r0=79(x1), r1=220(y1), r2=64(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 220
LDI r2, 64
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
