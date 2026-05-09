; DESCRIPTION: Draws a black line from (221, 69) to (71, 166).
; PLAN: r0=221(x1), r1=69(y1), r2=71(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 69
LDI r2, 71
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
