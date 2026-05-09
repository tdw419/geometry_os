; DESCRIPTION: Renders a white line between points (68, 230) and (32, 72).
; PLAN: r0=68(x1), r1=230(y1), r2=32(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 230
LDI r2, 32
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
