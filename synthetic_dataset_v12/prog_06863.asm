; DESCRIPTION: Composite: Sets a single green pixel at (381, 104) then Renders a magenta disk with center (446, 143) and radius 55 then Draws a orange line from (342, 2) to (161, 117).
; PLAN: r0=381(x), r1=104(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=446(x), r6=143(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=342(x1), r11=2(y1), r12=161(x2), r13=117(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 104
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 446
LDI r6, 143
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 342
LDI r11, 2
LDI r12, 161
LDI r13, 117
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
