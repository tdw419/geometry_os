; DESCRIPTION: Draws a green line from (380, 58) to (400, 72).
; PLAN: r0=380(x1), r1=58(y1), r2=400(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 58
LDI r2, 400
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
