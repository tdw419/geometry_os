; DESCRIPTION: Draws a white line from (415, 182) to (126, 176).
; PLAN: r0=415(x1), r1=182(y1), r2=126(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 182
LDI r2, 126
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
