; DESCRIPTION: Draws a cyan line from (6, 182) to (120, 130).
; PLAN: r0=6(x1), r1=182(y1), r2=120(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 182
LDI r2, 120
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
