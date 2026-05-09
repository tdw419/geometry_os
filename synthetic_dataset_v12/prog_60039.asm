; DESCRIPTION: Composite: Renders a yellow line between points (134, 167) and (280, 239) then Draws a red circle centered at (161, 144) with radius 54 then Places a purple dot at position (304, 182).
; PLAN: r0=134(x1), r1=167(y1), r2=280(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=144(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=304(x), r11=182(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 134
LDI r1, 167
LDI r2, 280
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 144
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 304
LDI r11, 182
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
