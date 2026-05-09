; DESCRIPTION: Renders a magenta line between points (126, 172) and (245, 183).
; PLAN: r0=126(x1), r1=172(y1), r2=245(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 172
LDI r2, 245
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
