; DESCRIPTION: Draws a white line from (92, 46) to (9, 170).
; PLAN: r0=92(x1), r1=46(y1), r2=9(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 46
LDI r2, 9
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
