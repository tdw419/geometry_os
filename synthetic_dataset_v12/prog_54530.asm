; DESCRIPTION: Draws a orange line from (116, 209) to (330, 84).
; PLAN: r0=116(x1), r1=209(y1), r2=330(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 209
LDI r2, 330
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
