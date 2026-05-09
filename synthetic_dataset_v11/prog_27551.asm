; DESCRIPTION: Renders a purple line between points (218, 233) and (187, 164).
; PLAN: r0=218(x1), r1=233(y1), r2=187(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 233
LDI r2, 187
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
