; DESCRIPTION: Renders a magenta line between points (506, 240) and (410, 176).
; PLAN: r0=506(x1), r1=240(y1), r2=410(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 240
LDI r2, 410
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
