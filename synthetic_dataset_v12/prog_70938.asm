; DESCRIPTION: Draws a white line from (391, 238) to (28, 202).
; PLAN: r0=391(x1), r1=238(y1), r2=28(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 238
LDI r2, 28
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
