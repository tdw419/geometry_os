; DESCRIPTION: Draws a white line from (17, 194) to (473, 186).
; PLAN: r0=17(x1), r1=194(y1), r2=473(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 194
LDI r2, 473
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
