; DESCRIPTION: Renders a cyan line between points (126, 24) and (13, 88).
; PLAN: r0=126(x1), r1=24(y1), r2=13(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 24
LDI r2, 13
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
