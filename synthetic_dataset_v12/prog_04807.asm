; DESCRIPTION: Renders a orange line between points (489, 239) and (209, 56).
; PLAN: r0=489(x1), r1=239(y1), r2=209(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 239
LDI r2, 209
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
