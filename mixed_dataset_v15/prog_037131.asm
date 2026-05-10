; DESCRIPTION: Renders a cyan line between points (225, 78) and (57, 178).
; PLAN: r0=225(x1), r1=78(y1), r2=57(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 78
LDI r2, 57
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
