; DESCRIPTION: Draws a white line from (12, 39) to (151, 73).
; PLAN: r0=12(x1), r1=39(y1), r2=151(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 39
LDI r2, 151
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
