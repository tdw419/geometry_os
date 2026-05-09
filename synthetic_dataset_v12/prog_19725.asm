; DESCRIPTION: Draws a orange line from (344, 59) to (446, 142).
; PLAN: r0=344(x1), r1=59(y1), r2=446(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 59
LDI r2, 446
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
