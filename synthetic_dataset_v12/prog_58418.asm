; DESCRIPTION: Draws a white line from (217, 37) to (73, 223).
; PLAN: r0=217(x1), r1=37(y1), r2=73(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 37
LDI r2, 73
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
