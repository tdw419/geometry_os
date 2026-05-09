; DESCRIPTION: Draws a green line from (350, 177) to (134, 151).
; PLAN: r0=350(x1), r1=177(y1), r2=134(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 177
LDI r2, 134
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
