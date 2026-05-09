; DESCRIPTION: Draws a white line from (133, 88) to (255, 209).
; PLAN: r0=133(x1), r1=88(y1), r2=255(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 88
LDI r2, 255
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
