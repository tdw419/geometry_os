; DESCRIPTION: Renders a cyan line between points (300, 248) and (2, 122).
; PLAN: r0=300(x1), r1=248(y1), r2=2(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 248
LDI r2, 2
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
