; DESCRIPTION: Renders a magenta line between points (294, 179) and (189, 206).
; PLAN: r0=294(x1), r1=179(y1), r2=189(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 179
LDI r2, 189
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
