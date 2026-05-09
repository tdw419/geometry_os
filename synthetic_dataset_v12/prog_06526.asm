; DESCRIPTION: Renders a cyan line between points (248, 7) and (375, 90).
; PLAN: r0=248(x1), r1=7(y1), r2=375(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 7
LDI r2, 375
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
