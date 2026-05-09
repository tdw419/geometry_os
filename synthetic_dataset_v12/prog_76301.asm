; DESCRIPTION: Draws a white line from (324, 126) to (396, 88).
; PLAN: r0=324(x1), r1=126(y1), r2=396(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 126
LDI r2, 396
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
