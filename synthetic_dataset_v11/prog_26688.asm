; DESCRIPTION: Draws a blue line from (255, 207) to (171, 29).
; PLAN: r0=255(x1), r1=207(y1), r2=171(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 207
LDI r2, 171
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
