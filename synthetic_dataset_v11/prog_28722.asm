; DESCRIPTION: Renders a cyan line between points (140, 157) and (225, 5).
; PLAN: r0=140(x1), r1=157(y1), r2=225(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 157
LDI r2, 225
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
