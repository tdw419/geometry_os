; DESCRIPTION: Draws a white line from (226, 74) to (194, 113).
; PLAN: r0=226(x1), r1=74(y1), r2=194(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 74
LDI r2, 194
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
