; DESCRIPTION: Renders a black line between points (440, 208) and (509, 74).
; PLAN: r0=440(x1), r1=208(y1), r2=509(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 208
LDI r2, 509
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
