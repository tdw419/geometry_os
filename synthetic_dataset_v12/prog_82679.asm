; DESCRIPTION: Draws a yellow line from (499, 213) to (280, 105).
; PLAN: r0=499(x1), r1=213(y1), r2=280(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 213
LDI r2, 280
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
