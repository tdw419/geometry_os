; DESCRIPTION: Draws a white line from (144, 60) to (219, 96).
; PLAN: r0=144(x1), r1=60(y1), r2=219(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 60
LDI r2, 219
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
