; DESCRIPTION: Renders a magenta line between points (265, 240) and (342, 0).
; PLAN: r0=265(x1), r1=240(y1), r2=342(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 240
LDI r2, 342
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
