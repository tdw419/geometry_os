; DESCRIPTION: Draws a blue line from (298, 244) to (364, 248).
; PLAN: r0=298(x1), r1=244(y1), r2=364(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 244
LDI r2, 364
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
