; DESCRIPTION: Draws a green line from (403, 76) to (105, 151).
; PLAN: r0=403(x1), r1=76(y1), r2=105(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 76
LDI r2, 105
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
