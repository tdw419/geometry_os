; DESCRIPTION: Renders a cyan line between points (258, 66) and (151, 216).
; PLAN: r0=258(x1), r1=66(y1), r2=151(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 66
LDI r2, 151
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
