; DESCRIPTION: Renders a red line between points (475, 32) and (215, 155).
; PLAN: r0=475(x1), r1=32(y1), r2=215(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 32
LDI r2, 215
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
