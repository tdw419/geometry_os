; DESCRIPTION: Renders a cyan line between points (411, 83) and (472, 64).
; PLAN: r0=411(x1), r1=83(y1), r2=472(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 83
LDI r2, 472
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
