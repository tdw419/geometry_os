; DESCRIPTION: Renders a magenta line between points (228, 78) and (10, 164).
; PLAN: r0=228(x1), r1=78(y1), r2=10(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 78
LDI r2, 10
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
