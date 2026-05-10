; DESCRIPTION: Renders a cyan line between points (356, 110) and (411, 255).
; PLAN: r0=356(x1), r1=110(y1), r2=411(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 110
LDI r2, 411
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
