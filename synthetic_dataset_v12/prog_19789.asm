; DESCRIPTION: Draws a purple line from (398, 14) to (320, 75).
; PLAN: r0=398(x1), r1=14(y1), r2=320(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 14
LDI r2, 320
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
