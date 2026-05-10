; DESCRIPTION: Renders a cyan line between points (404, 139) and (14, 81).
; PLAN: r0=404(x1), r1=139(y1), r2=14(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 139
LDI r2, 14
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
