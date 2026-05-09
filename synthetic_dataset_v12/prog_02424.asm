; DESCRIPTION: Composite: Draws a blue circle centered at (452, 129) with radius 46 then Draws a magenta line from (47, 239) to (166, 51) then Places a purple dot at position (38, 17).
; PLAN: r0=452(x), r1=129(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x1), r6=239(y1), r7=166(x2), r8=51(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=38(x), r11=17(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 452
LDI r1, 129
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 239
LDI r7, 166
LDI r8, 51
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 38
LDI r11, 17
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
