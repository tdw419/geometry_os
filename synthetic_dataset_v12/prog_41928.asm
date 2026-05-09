; DESCRIPTION: Renders a black line between points (103, 215) and (342, 63).
; PLAN: r0=103(x1), r1=215(y1), r2=342(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 215
LDI r2, 342
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
