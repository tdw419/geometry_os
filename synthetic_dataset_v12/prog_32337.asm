; DESCRIPTION: Draws a white line from (39, 233) to (73, 37).
; PLAN: r0=39(x1), r1=233(y1), r2=73(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 233
LDI r2, 73
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
