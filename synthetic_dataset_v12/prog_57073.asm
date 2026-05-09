; DESCRIPTION: Renders a black line between points (92, 196) and (295, 158).
; PLAN: r0=92(x1), r1=196(y1), r2=295(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 196
LDI r2, 295
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
