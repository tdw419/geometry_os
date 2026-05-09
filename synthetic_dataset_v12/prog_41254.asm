; DESCRIPTION: Renders a magenta line between points (196, 28) and (486, 246).
; PLAN: r0=196(x1), r1=28(y1), r2=486(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 28
LDI r2, 486
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
