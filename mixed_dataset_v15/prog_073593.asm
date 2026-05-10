; DESCRIPTION: Draws a green line from (303, 197) to (469, 0).
; PLAN: r0=303(x1), r1=197(y1), r2=469(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 197
LDI r2, 469
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
