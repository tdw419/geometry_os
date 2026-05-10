; DESCRIPTION: Draws a white line from (396, 84) to (59, 196).
; PLAN: r0=396(x1), r1=84(y1), r2=59(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 84
LDI r2, 59
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
