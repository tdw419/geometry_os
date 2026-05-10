; DESCRIPTION: Draws a white line from (378, 14) to (465, 92).
; PLAN: r0=378(x1), r1=14(y1), r2=465(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 14
LDI r2, 465
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
