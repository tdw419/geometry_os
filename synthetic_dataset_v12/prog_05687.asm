; DESCRIPTION: Renders a cyan line between points (355, 87) and (402, 4).
; PLAN: r0=355(x1), r1=87(y1), r2=402(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 87
LDI r2, 402
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
