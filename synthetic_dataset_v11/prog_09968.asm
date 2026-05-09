; DESCRIPTION: Renders a cyan line between points (188, 81) and (143, 128).
; PLAN: r0=188(x1), r1=81(y1), r2=143(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 81
LDI r2, 143
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
