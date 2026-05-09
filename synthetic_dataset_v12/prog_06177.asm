; DESCRIPTION: Draws a black line from (465, 231) to (134, 246).
; PLAN: r0=465(x1), r1=231(y1), r2=134(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 231
LDI r2, 134
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
