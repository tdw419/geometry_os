; DESCRIPTION: Draws a cyan line from (495, 182) to (373, 148).
; PLAN: r0=495(x1), r1=182(y1), r2=373(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 182
LDI r2, 373
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
