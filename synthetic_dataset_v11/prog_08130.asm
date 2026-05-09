; DESCRIPTION: Renders a cyan line between points (9, 176) and (126, 130).
; PLAN: r0=9(x1), r1=176(y1), r2=126(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 176
LDI r2, 126
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
