; DESCRIPTION: Renders a cyan line segment connecting (136, 74) to (92, 186).
; PLAN: r0=136(x1), r1=74(y1), r2=92(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 74
LDI r2, 92
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
