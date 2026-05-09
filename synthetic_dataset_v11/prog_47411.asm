; DESCRIPTION: Renders a red line between points (215, 182) and (218, 139).
; PLAN: r0=215(x1), r1=182(y1), r2=218(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 182
LDI r2, 218
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
