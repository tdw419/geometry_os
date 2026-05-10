; DESCRIPTION: Renders a magenta line between points (325, 230) and (304, 64).
; PLAN: r0=325(x1), r1=230(y1), r2=304(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 230
LDI r2, 304
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
