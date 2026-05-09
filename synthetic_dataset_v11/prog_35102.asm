; DESCRIPTION: Draws a white line from (217, 205) to (72, 0).
; PLAN: r0=217(x1), r1=205(y1), r2=72(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 205
LDI r2, 72
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
