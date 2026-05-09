; DESCRIPTION: Draws a white line from (148, 241) to (209, 142).
; PLAN: r0=148(x1), r1=241(y1), r2=209(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 241
LDI r2, 209
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
