; DESCRIPTION: Draws a black line from (438, 10) to (352, 36).
; PLAN: r0=438(x1), r1=10(y1), r2=352(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 10
LDI r2, 352
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
