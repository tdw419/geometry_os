; DESCRIPTION: Renders a magenta line between points (180, 98) and (85, 204).
; PLAN: r0=180(x1), r1=98(y1), r2=85(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 98
LDI r2, 85
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
