; DESCRIPTION: Draws a green line from (142, 235) to (333, 182).
; PLAN: r0=142(x1), r1=235(y1), r2=333(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 235
LDI r2, 333
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
