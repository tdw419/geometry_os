; DESCRIPTION: Renders a cyan line between points (191, 110) and (216, 111).
; PLAN: r0=191(x1), r1=110(y1), r2=216(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 110
LDI r2, 216
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
