; DESCRIPTION: Draws a white line from (483, 232) to (445, 195).
; PLAN: r0=483(x1), r1=232(y1), r2=445(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 232
LDI r2, 445
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
