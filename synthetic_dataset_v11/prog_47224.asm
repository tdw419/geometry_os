; DESCRIPTION: Places a magenta line segment connecting (136, 228) to (181, 186).
; PLAN: r0=136(x1), r1=228(y1), r2=181(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 228
LDI r2, 181
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
