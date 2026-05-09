; DESCRIPTION: Renders a magenta line between points (394, 111) and (5, 238).
; PLAN: r0=394(x1), r1=111(y1), r2=5(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 111
LDI r2, 5
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
