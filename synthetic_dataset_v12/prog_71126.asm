; DESCRIPTION: Draws a black line from (53, 116) to (329, 46).
; PLAN: r0=53(x1), r1=116(y1), r2=329(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 116
LDI r2, 329
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
