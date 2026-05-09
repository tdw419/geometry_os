; DESCRIPTION: Renders a cyan line between points (63, 76) and (351, 193).
; PLAN: r0=63(x1), r1=76(y1), r2=351(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 76
LDI r2, 351
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
