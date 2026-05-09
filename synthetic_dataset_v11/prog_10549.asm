; DESCRIPTION: Renders a cyan line between points (106, 157) and (150, 183).
; PLAN: r0=106(x1), r1=157(y1), r2=150(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 157
LDI r2, 150
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
