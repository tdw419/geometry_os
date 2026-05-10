; DESCRIPTION: Draws a white line from (74, 19) to (289, 107).
; PLAN: r0=74(x1), r1=19(y1), r2=289(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 19
LDI r2, 289
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
