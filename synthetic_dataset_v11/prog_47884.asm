; DESCRIPTION: Draws a black line from (14, 207) to (213, 46).
; PLAN: r0=14(x1), r1=207(y1), r2=213(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 207
LDI r2, 213
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
