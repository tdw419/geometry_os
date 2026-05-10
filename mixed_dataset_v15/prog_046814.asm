; DESCRIPTION: Draws a black line from (322, 80) to (281, 69).
; PLAN: r0=322(x1), r1=80(y1), r2=281(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 80
LDI r2, 281
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
