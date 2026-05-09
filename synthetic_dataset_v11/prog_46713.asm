; DESCRIPTION: Draws a green line from (217, 43) to (93, 198).
; PLAN: r0=217(x1), r1=43(y1), r2=93(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 43
LDI r2, 93
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
