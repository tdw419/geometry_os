; DESCRIPTION: Renders a cyan line between points (225, 26) and (76, 139).
; PLAN: r0=225(x1), r1=26(y1), r2=76(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 26
LDI r2, 76
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
