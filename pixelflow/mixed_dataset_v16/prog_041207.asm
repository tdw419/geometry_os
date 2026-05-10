; DESCRIPTION: Draws a green line from (64, 149) to (7, 84).
; PLAN: r0=64(x1), r1=149(y1), r2=7(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 149
LDI r2, 7
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
