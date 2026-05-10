; DESCRIPTION: Draws a blue line from (152, 135) to (50, 59).
; PLAN: r0=152(x1), r1=135(y1), r2=50(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 135
LDI r2, 50
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
