; DESCRIPTION: Renders a cyan line between points (157, 113) and (372, 139).
; PLAN: r0=157(x1), r1=113(y1), r2=372(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 113
LDI r2, 372
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
