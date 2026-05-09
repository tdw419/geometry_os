; DESCRIPTION: Draws a white line from (69, 237) to (26, 171).
; PLAN: r0=69(x1), r1=237(y1), r2=26(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 237
LDI r2, 26
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
