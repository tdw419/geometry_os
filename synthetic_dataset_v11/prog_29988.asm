; DESCRIPTION: Renders a magenta line between points (92, 211) and (231, 173).
; PLAN: r0=92(x1), r1=211(y1), r2=231(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 211
LDI r2, 231
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
