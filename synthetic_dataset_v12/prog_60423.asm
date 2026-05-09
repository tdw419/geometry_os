; DESCRIPTION: Draws a orange line from (426, 106) to (295, 29).
; PLAN: r0=426(x1), r1=106(y1), r2=295(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 106
LDI r2, 295
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
