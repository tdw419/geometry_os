; DESCRIPTION: Draws a white line from (126, 141) to (436, 96).
; PLAN: r0=126(x1), r1=141(y1), r2=436(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 141
LDI r2, 436
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
