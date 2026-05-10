; DESCRIPTION: Draws a black line from (271, 231) to (15, 71).
; PLAN: r0=271(x1), r1=231(y1), r2=15(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 231
LDI r2, 15
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
