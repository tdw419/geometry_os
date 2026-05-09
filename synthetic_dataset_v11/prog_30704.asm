; DESCRIPTION: Places a white line segment connecting (82, 182) to (217, 137).
; PLAN: r0=82(x1), r1=182(y1), r2=217(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 182
LDI r2, 217
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
