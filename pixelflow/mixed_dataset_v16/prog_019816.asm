; DESCRIPTION: Composite: Creates a yellow circular shape at (416, 82) with radius 79 then Draws a blue line from (158, 244) to (436, 222) then Sets a single white pixel at (408, 165).
; PLAN: r0=416(x), r1=82(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x1), r6=244(y1), r7=436(x2), r8=222(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=408(x), r11=165(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 82
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 244
LDI r7, 436
LDI r8, 222
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 165
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
