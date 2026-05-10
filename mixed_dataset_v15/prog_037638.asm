; DESCRIPTION: Draws a black line from (466, 207) to (48, 87).
; PLAN: r0=466(x1), r1=207(y1), r2=48(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 207
LDI r2, 48
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
