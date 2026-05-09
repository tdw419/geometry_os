; DESCRIPTION: Draws a black line from (276, 202) to (368, 50).
; PLAN: r0=276(x1), r1=202(y1), r2=368(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 202
LDI r2, 368
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
