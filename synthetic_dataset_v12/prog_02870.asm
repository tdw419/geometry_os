; DESCRIPTION: Draws a white line from (108, 95) to (328, 29).
; PLAN: r0=108(x1), r1=95(y1), r2=328(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 95
LDI r2, 328
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
