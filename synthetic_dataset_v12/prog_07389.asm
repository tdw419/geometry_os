; DESCRIPTION: Draws a red line from (495, 111) to (378, 77).
; PLAN: r0=495(x1), r1=111(y1), r2=378(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 111
LDI r2, 378
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
