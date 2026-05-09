; DESCRIPTION: Renders a cyan line between points (164, 182) and (139, 152).
; PLAN: r0=164(x1), r1=182(y1), r2=139(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 182
LDI r2, 139
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
