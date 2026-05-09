; DESCRIPTION: Renders a white line between points (1, 230) and (247, 96).
; PLAN: r0=1(x1), r1=230(y1), r2=247(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 230
LDI r2, 247
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
