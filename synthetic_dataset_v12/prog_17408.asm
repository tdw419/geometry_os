; DESCRIPTION: Draws a white line from (25, 254) to (52, 167).
; PLAN: r0=25(x1), r1=254(y1), r2=52(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 254
LDI r2, 52
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
