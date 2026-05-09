; DESCRIPTION: Renders a magenta line between points (9, 110) and (42, 64).
; PLAN: r0=9(x1), r1=110(y1), r2=42(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 110
LDI r2, 42
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
