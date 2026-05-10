; DESCRIPTION: Draws a white line from (446, 158) to (286, 203).
; PLAN: r0=446(x1), r1=158(y1), r2=286(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 158
LDI r2, 286
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
