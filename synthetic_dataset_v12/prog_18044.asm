; DESCRIPTION: Draws a black line from (368, 144) to (482, 12).
; PLAN: r0=368(x1), r1=144(y1), r2=482(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 144
LDI r2, 482
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
