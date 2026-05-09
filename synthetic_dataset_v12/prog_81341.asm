; DESCRIPTION: Draws a white line from (96, 112) to (182, 204).
; PLAN: r0=96(x1), r1=112(y1), r2=182(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 112
LDI r2, 182
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
