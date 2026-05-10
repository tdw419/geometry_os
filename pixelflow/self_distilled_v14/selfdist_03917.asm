; DESCRIPTION: Renders a red line segment connecting (127, 196) to (263, 163).
; PLAN: r0=127(x1), r1=196(y1), r2=263(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 196
LDI r2, 263
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
