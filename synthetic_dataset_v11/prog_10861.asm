; DESCRIPTION: Renders a white line between points (215, 136) and (247, 244).
; PLAN: r0=215(x1), r1=136(y1), r2=247(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 136
LDI r2, 247
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
