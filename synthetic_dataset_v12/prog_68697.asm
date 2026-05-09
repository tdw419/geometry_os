; DESCRIPTION: Renders a cyan line between points (324, 195) and (363, 104).
; PLAN: r0=324(x1), r1=195(y1), r2=363(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 195
LDI r2, 363
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
