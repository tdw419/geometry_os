; DESCRIPTION: Draws a black line from (487, 187) to (53, 151).
; PLAN: r0=487(x1), r1=187(y1), r2=53(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 187
LDI r2, 53
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
