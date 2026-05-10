; DESCRIPTION: Draws a white line from (96, 69) to (35, 198).
; PLAN: r0=96(x1), r1=69(y1), r2=35(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 69
LDI r2, 35
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
