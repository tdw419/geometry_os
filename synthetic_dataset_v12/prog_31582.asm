; DESCRIPTION: Renders a cyan line between points (54, 178) and (157, 99).
; PLAN: r0=54(x1), r1=178(y1), r2=157(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 178
LDI r2, 157
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
