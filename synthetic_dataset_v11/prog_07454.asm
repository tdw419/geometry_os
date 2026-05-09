; DESCRIPTION: Draws a white line from (178, 30) to (0, 135).
; PLAN: r0=178(x1), r1=30(y1), r2=0(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 30
LDI r2, 0
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
