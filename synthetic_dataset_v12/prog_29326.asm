; DESCRIPTION: Draws a white line from (121, 69) to (255, 15).
; PLAN: r0=121(x1), r1=69(y1), r2=255(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 69
LDI r2, 255
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
