; DESCRIPTION: Renders a cyan line between points (114, 157) and (424, 45).
; PLAN: r0=114(x1), r1=157(y1), r2=424(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 157
LDI r2, 424
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
