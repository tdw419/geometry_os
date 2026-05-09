; DESCRIPTION: Draws a orange line from (62, 209) to (10, 213).
; PLAN: r0=62(x1), r1=209(y1), r2=10(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 209
LDI r2, 10
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
