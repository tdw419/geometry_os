; DESCRIPTION: Draws a yellow line from (398, 110) to (434, 56).
; PLAN: r0=398(x1), r1=110(y1), r2=434(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 110
LDI r2, 434
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
