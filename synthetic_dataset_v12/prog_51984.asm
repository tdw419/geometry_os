; DESCRIPTION: Draws a white line from (381, 174) to (354, 64).
; PLAN: r0=381(x1), r1=174(y1), r2=354(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 174
LDI r2, 354
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
