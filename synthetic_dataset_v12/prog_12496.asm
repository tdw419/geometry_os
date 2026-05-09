; DESCRIPTION: Draws a blue line from (295, 96) to (58, 115).
; PLAN: r0=295(x1), r1=96(y1), r2=58(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 96
LDI r2, 58
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
