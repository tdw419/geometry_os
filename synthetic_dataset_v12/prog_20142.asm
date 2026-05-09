; DESCRIPTION: Draws a white line from (327, 203) to (384, 74).
; PLAN: r0=327(x1), r1=203(y1), r2=384(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 203
LDI r2, 384
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
