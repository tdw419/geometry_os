; DESCRIPTION: Draws a white line from (184, 254) to (306, 43).
; PLAN: r0=184(x1), r1=254(y1), r2=306(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 254
LDI r2, 306
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
