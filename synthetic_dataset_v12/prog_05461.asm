; DESCRIPTION: Draws a green line from (270, 205) to (96, 26).
; PLAN: r0=270(x1), r1=205(y1), r2=96(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 205
LDI r2, 96
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
