; DESCRIPTION: Renders a cyan line between points (232, 94) and (16, 15).
; PLAN: r0=232(x1), r1=94(y1), r2=16(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 94
LDI r2, 16
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
