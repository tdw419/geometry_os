; DESCRIPTION: Draws a orange line from (113, 95) to (255, 220).
; PLAN: r0=113(x1), r1=95(y1), r2=255(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 95
LDI r2, 255
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
