; DESCRIPTION: Composite: Draws a purple line from (121, 127) to (310, 54) then Draws a purple circle centered at (409, 151) with radius 42 then Sets a single red pixel at (461, 39).
; PLAN: r0=121(x1), r1=127(y1), r2=310(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=151(y), r7=42(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=461(x), r11=39(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 121
LDI r1, 127
LDI r2, 310
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 151
LDI r7, 42
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 461
LDI r11, 39
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
