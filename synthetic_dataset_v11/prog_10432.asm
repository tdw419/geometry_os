; DESCRIPTION: Draws a white line from (108, 197) to (92, 130).
; PLAN: r0=108(x1), r1=197(y1), r2=92(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 197
LDI r2, 92
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
