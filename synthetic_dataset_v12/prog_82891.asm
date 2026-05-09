; DESCRIPTION: Draws a white line from (81, 59) to (416, 203).
; PLAN: r0=81(x1), r1=59(y1), r2=416(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 59
LDI r2, 416
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
