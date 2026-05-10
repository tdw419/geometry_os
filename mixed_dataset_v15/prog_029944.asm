; DESCRIPTION: Draws a orange line from (295, 35) to (96, 144).
; PLAN: r0=295(x1), r1=35(y1), r2=96(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 35
LDI r2, 96
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
