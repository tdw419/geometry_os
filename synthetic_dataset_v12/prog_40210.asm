; DESCRIPTION: Draws a black line from (425, 37) to (469, 36).
; PLAN: r0=425(x1), r1=37(y1), r2=469(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 37
LDI r2, 469
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
