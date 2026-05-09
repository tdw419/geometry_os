; DESCRIPTION: Renders a black line between points (295, 216) and (344, 255).
; PLAN: r0=295(x1), r1=216(y1), r2=344(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 216
LDI r2, 344
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
