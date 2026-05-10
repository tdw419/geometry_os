; DESCRIPTION: Draws a white line from (237, 58) to (308, 67).
; PLAN: r0=237(x1), r1=58(y1), r2=308(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 58
LDI r2, 308
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
