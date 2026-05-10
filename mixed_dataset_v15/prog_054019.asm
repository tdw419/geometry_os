; DESCRIPTION: Composite: Sets a single white pixel at (204, 161) then Draws a yellow circle centered at (277, 218) with radius 29 then Draws a red line from (461, 157) to (367, 83).
; PLAN: r0=204(x), r1=161(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=218(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=461(x1), r11=157(y1), r12=367(x2), r13=83(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 161
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 277
LDI r6, 218
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 461
LDI r11, 157
LDI r12, 367
LDI r13, 83
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
