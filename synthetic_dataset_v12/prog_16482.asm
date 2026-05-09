; DESCRIPTION: Draws a white line from (138, 73) to (382, 74).
; PLAN: r0=138(x1), r1=73(y1), r2=382(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 73
LDI r2, 382
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
