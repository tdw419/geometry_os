; DESCRIPTION: Draws a white line from (82, 250) to (64, 130).
; PLAN: r0=82(x1), r1=250(y1), r2=64(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 250
LDI r2, 64
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
