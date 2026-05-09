; DESCRIPTION: Draws a white line from (442, 187) to (322, 170).
; PLAN: r0=442(x1), r1=187(y1), r2=322(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 187
LDI r2, 322
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
