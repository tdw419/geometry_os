; DESCRIPTION: Draws a black line from (104, 93) to (240, 129).
; PLAN: r0=104(x1), r1=93(y1), r2=240(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 93
LDI r2, 240
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
