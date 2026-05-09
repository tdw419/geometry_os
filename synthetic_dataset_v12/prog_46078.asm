; DESCRIPTION: Renders a cyan line between points (157, 132) and (155, 32).
; PLAN: r0=157(x1), r1=132(y1), r2=155(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 132
LDI r2, 155
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
