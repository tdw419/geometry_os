; DESCRIPTION: Renders a green line between points (104, 5) and (440, 230).
; PLAN: r0=104(x1), r1=5(y1), r2=440(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 5
LDI r2, 440
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
