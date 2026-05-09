; DESCRIPTION: Draws a black line from (482, 25) to (438, 166).
; PLAN: r0=482(x1), r1=25(y1), r2=438(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 25
LDI r2, 438
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
