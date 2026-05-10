; DESCRIPTION: Renders a magenta line between points (111, 90) and (167, 161).
; PLAN: r0=111(x1), r1=90(y1), r2=167(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 90
LDI r2, 167
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
