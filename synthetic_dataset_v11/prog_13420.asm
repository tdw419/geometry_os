; DESCRIPTION: Renders a cyan line between points (191, 45) and (122, 68).
; PLAN: r0=191(x1), r1=45(y1), r2=122(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 45
LDI r2, 122
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
