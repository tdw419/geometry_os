; DESCRIPTION: Draws a white line from (194, 199) to (213, 48).
; PLAN: r0=194(x1), r1=199(y1), r2=213(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 199
LDI r2, 213
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
