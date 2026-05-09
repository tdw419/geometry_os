; DESCRIPTION: Renders a green line between points (329, 104) and (5, 55).
; PLAN: r0=329(x1), r1=104(y1), r2=5(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 104
LDI r2, 5
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
