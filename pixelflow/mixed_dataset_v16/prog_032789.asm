; DESCRIPTION: Draws a white line from (135, 109) to (274, 250).
; PLAN: r0=135(x1), r1=109(y1), r2=274(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 109
LDI r2, 274
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
