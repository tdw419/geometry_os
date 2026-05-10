; DESCRIPTION: Renders a magenta line between points (498, 32) and (186, 73).
; PLAN: r0=498(x1), r1=32(y1), r2=186(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 32
LDI r2, 186
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
