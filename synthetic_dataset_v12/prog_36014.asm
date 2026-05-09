; DESCRIPTION: Renders a cyan line between points (442, 57) and (17, 145).
; PLAN: r0=442(x1), r1=57(y1), r2=17(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 57
LDI r2, 17
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
