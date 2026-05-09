; DESCRIPTION: Renders a cyan line between points (376, 182) and (428, 231).
; PLAN: r0=376(x1), r1=182(y1), r2=428(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 182
LDI r2, 428
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
