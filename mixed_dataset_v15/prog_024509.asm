; DESCRIPTION: Draws a red line from (121, 200) to (488, 151).
; PLAN: r0=121(x1), r1=200(y1), r2=488(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 200
LDI r2, 488
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
