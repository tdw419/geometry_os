; DESCRIPTION: Renders a magenta line between points (248, 240) and (459, 164).
; PLAN: r0=248(x1), r1=240(y1), r2=459(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 240
LDI r2, 459
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
