; DESCRIPTION: Draws a white line from (425, 28) to (252, 73).
; PLAN: r0=425(x1), r1=28(y1), r2=252(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 28
LDI r2, 252
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
