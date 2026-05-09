; DESCRIPTION: Draws a green line from (354, 140) to (437, 34).
; PLAN: r0=354(x1), r1=140(y1), r2=437(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 140
LDI r2, 437
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
