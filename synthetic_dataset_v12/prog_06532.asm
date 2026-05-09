; DESCRIPTION: Renders a cyan line between points (252, 191) and (471, 157).
; PLAN: r0=252(x1), r1=191(y1), r2=471(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 191
LDI r2, 471
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
