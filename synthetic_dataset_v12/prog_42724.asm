; DESCRIPTION: Renders a cyan line between points (175, 74) and (472, 65).
; PLAN: r0=175(x1), r1=74(y1), r2=472(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 74
LDI r2, 472
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
