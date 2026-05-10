; DESCRIPTION: Renders a magenta line between points (64, 165) and (261, 24).
; PLAN: r0=64(x1), r1=165(y1), r2=261(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 165
LDI r2, 261
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
