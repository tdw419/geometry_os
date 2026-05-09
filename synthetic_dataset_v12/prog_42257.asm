; DESCRIPTION: Draws a white line from (47, 238) to (426, 71).
; PLAN: r0=47(x1), r1=238(y1), r2=426(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 238
LDI r2, 426
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
