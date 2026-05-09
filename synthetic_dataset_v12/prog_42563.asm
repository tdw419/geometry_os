; DESCRIPTION: Draws a green line from (370, 163) to (58, 19).
; PLAN: r0=370(x1), r1=163(y1), r2=58(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 163
LDI r2, 58
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
