; DESCRIPTION: Draws a white line from (275, 35) to (92, 140).
; PLAN: r0=275(x1), r1=35(y1), r2=92(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 35
LDI r2, 92
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
