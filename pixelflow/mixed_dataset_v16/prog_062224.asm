; DESCRIPTION: Draws a white line from (140, 46) to (20, 20).
; PLAN: r0=140(x1), r1=46(y1), r2=20(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 46
LDI r2, 20
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
