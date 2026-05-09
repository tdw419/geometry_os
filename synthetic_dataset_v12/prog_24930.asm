; DESCRIPTION: Draws a white line from (84, 144) to (350, 52).
; PLAN: r0=84(x1), r1=144(y1), r2=350(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 144
LDI r2, 350
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
