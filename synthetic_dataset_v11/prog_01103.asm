; DESCRIPTION: Draws a black line from (128, 59) to (162, 150).
; PLAN: r0=128(x1), r1=59(y1), r2=162(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 59
LDI r2, 162
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
