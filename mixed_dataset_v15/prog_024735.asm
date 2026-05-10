; DESCRIPTION: Draws a green line from (282, 33) to (450, 151).
; PLAN: r0=282(x1), r1=33(y1), r2=450(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 33
LDI r2, 450
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
