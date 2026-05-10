; DESCRIPTION: Draws a cyan line from (246, 83) to (373, 205).
; PLAN: r0=246(x1), r1=83(y1), r2=373(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 83
LDI r2, 373
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
