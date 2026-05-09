; DESCRIPTION: Draws a white line from (128, 140) to (74, 170).
; PLAN: r0=128(x1), r1=140(y1), r2=74(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 140
LDI r2, 74
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
