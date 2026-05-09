; DESCRIPTION: Renders a cyan line between points (309, 109) and (278, 199).
; PLAN: r0=309(x1), r1=109(y1), r2=278(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 109
LDI r2, 278
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
