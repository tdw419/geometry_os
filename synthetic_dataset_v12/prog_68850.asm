; DESCRIPTION: Renders a cyan line between points (140, 96) and (195, 244).
; PLAN: r0=140(x1), r1=96(y1), r2=195(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 96
LDI r2, 195
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
