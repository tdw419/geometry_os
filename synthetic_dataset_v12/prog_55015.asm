; DESCRIPTION: Draws a white line from (324, 230) to (308, 160).
; PLAN: r0=324(x1), r1=230(y1), r2=308(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 230
LDI r2, 308
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
