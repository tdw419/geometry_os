; DESCRIPTION: Draws a white line from (35, 126) to (6, 135).
; PLAN: r0=35(x1), r1=126(y1), r2=6(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 126
LDI r2, 6
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
