; DESCRIPTION: Composite: Sets a single magenta pixel at (162, 222) then Draws a yellow circle centered at (177, 57) with radius 48 then Draws a orange line from (456, 52) to (382, 82).
; PLAN: r0=162(x), r1=222(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=57(y), r7=48(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=456(x1), r11=52(y1), r12=382(x2), r13=82(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 222
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 177
LDI r6, 57
LDI r7, 48
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 456
LDI r11, 52
LDI r12, 382
LDI r13, 82
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
