; DESCRIPTION: Draws a white line from (236, 213) to (121, 203).
; PLAN: r0=236(x1), r1=213(y1), r2=121(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 213
LDI r2, 121
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
