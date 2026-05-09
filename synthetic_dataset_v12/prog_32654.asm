; DESCRIPTION: Renders a yellow line between points (315, 152) and (215, 109).
; PLAN: r0=315(x1), r1=152(y1), r2=215(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 152
LDI r2, 215
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
