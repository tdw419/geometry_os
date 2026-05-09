; DESCRIPTION: Renders a magenta line between points (383, 248) and (36, 196).
; PLAN: r0=383(x1), r1=248(y1), r2=36(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 248
LDI r2, 36
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
