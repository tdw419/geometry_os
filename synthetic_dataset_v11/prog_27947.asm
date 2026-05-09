; DESCRIPTION: Renders a magenta line between points (220, 166) and (20, 241).
; PLAN: r0=220(x1), r1=166(y1), r2=20(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 166
LDI r2, 20
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
