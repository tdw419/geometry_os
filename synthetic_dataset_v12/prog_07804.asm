; DESCRIPTION: Renders a magenta line between points (42, 208) and (47, 84).
; PLAN: r0=42(x1), r1=208(y1), r2=47(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 208
LDI r2, 47
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
