; DESCRIPTION: Draws a white line from (203, 64) to (472, 213).
; PLAN: r0=203(x1), r1=64(y1), r2=472(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 64
LDI r2, 472
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
