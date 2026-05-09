; DESCRIPTION: Draws a white line from (177, 238) to (497, 19).
; PLAN: r0=177(x1), r1=238(y1), r2=497(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 238
LDI r2, 497
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
