; DESCRIPTION: Renders a white line between points (264, 215) and (282, 25).
; PLAN: r0=264(x1), r1=215(y1), r2=282(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 215
LDI r2, 282
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
