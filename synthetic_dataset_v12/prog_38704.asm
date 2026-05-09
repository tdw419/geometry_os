; DESCRIPTION: Draws a blue line from (491, 206) to (410, 65).
; PLAN: r0=491(x1), r1=206(y1), r2=410(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 206
LDI r2, 410
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
