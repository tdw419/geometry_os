; DESCRIPTION: Renders a cyan line between points (126, 189) and (427, 67).
; PLAN: r0=126(x1), r1=189(y1), r2=427(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 189
LDI r2, 427
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
