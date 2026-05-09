; DESCRIPTION: Draws a white line from (495, 182) to (397, 150).
; PLAN: r0=495(x1), r1=182(y1), r2=397(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 182
LDI r2, 397
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
