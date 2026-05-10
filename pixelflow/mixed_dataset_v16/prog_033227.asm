; DESCRIPTION: Draws a black line from (373, 69) to (467, 237).
; PLAN: r0=373(x1), r1=69(y1), r2=467(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 69
LDI r2, 467
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
