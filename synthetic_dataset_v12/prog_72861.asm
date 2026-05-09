; DESCRIPTION: Draws a blue line from (298, 79) to (409, 222).
; PLAN: r0=298(x1), r1=79(y1), r2=409(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 79
LDI r2, 409
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
