; DESCRIPTION: Renders a magenta line between points (111, 62) and (128, 104).
; PLAN: r0=111(x1), r1=62(y1), r2=128(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 62
LDI r2, 128
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
