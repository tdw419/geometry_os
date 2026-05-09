; DESCRIPTION: Draws a white line from (247, 4) to (364, 214).
; PLAN: r0=247(x1), r1=4(y1), r2=364(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 4
LDI r2, 364
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
