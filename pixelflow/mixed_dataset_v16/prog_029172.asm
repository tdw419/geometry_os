; DESCRIPTION: Composite: Draws a purple line from (57, 213) to (264, 240) then Draws a white circle centered at (161, 57) with radius 44 then Places a yellow dot at position (394, 110).
; PLAN: r0=57(x1), r1=213(y1), r2=264(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=57(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=394(x), r11=110(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 57
LDI r1, 213
LDI r2, 264
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 57
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 394
LDI r11, 110
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
