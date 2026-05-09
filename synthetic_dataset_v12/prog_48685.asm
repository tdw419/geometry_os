; DESCRIPTION: Draws a white line from (280, 193) to (230, 69).
; PLAN: r0=280(x1), r1=193(y1), r2=230(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 193
LDI r2, 230
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
