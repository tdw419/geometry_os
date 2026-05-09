; DESCRIPTION: Renders a yellow line between points (295, 47) and (360, 78).
; PLAN: r0=295(x1), r1=47(y1), r2=360(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 47
LDI r2, 360
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
