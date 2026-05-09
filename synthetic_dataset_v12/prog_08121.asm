; DESCRIPTION: Renders a green line between points (365, 182) and (241, 255).
; PLAN: r0=365(x1), r1=182(y1), r2=241(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 182
LDI r2, 241
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
