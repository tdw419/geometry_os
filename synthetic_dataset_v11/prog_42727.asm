; DESCRIPTION: Draws a green line from (160, 96) to (143, 162).
; PLAN: r0=160(x1), r1=96(y1), r2=143(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 96
LDI r2, 143
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
