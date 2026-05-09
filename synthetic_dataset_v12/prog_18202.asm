; DESCRIPTION: Renders a magenta line between points (90, 103) and (228, 159).
; PLAN: r0=90(x1), r1=103(y1), r2=228(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 103
LDI r2, 228
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
