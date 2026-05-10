; DESCRIPTION: Renders a white line between points (436, 107) and (259, 178).
; PLAN: r0=436(x1), r1=107(y1), r2=259(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 107
LDI r2, 259
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
