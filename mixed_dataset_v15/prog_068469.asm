; DESCRIPTION: Draws a cyan line from (110, 1) to (105, 151).
; PLAN: r0=110(x1), r1=1(y1), r2=105(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 1
LDI r2, 105
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
