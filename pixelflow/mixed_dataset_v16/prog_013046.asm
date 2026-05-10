; DESCRIPTION: Draws a black line from (161, 207) to (352, 15).
; PLAN: r0=161(x1), r1=207(y1), r2=352(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 207
LDI r2, 352
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
