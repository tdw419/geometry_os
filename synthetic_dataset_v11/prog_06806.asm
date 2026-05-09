; DESCRIPTION: Renders a magenta line between points (248, 121) and (228, 219).
; PLAN: r0=248(x1), r1=121(y1), r2=228(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 121
LDI r2, 228
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
