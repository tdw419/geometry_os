; DESCRIPTION: Draws a black line from (96, 186) to (172, 63).
; PLAN: r0=96(x1), r1=186(y1), r2=172(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 186
LDI r2, 172
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
