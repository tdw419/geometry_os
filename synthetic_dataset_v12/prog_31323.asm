; DESCRIPTION: Draws a blue line from (340, 248) to (33, 29).
; PLAN: r0=340(x1), r1=248(y1), r2=33(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 248
LDI r2, 33
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
