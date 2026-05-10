; DESCRIPTION: Renders a cyan line between points (153, 14) and (225, 204).
; PLAN: r0=153(x1), r1=14(y1), r2=225(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 14
LDI r2, 225
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
