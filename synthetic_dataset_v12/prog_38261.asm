; DESCRIPTION: Draws a white line from (117, 12) to (385, 184).
; PLAN: r0=117(x1), r1=12(y1), r2=385(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 12
LDI r2, 385
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
