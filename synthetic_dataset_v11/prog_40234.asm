; DESCRIPTION: Renders a cyan line between points (186, 49) and (5, 58).
; PLAN: r0=186(x1), r1=49(y1), r2=5(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 49
LDI r2, 5
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
