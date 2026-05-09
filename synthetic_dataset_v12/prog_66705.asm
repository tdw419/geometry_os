; DESCRIPTION: Draws a white line from (160, 88) to (294, 207).
; PLAN: r0=160(x1), r1=88(y1), r2=294(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 88
LDI r2, 294
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
