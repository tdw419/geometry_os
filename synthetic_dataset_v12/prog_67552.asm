; DESCRIPTION: Composite: Places a yellow dot at position (48, 19) then Creates a yellow circular shape at (277, 134) with radius 78 then Places a magenta 36x80 rectangle at position (296, 161).
; PLAN: r0=48(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=134(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=296(x), r11=161(y), r12=36(width), r13=80(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 19
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 277
LDI r6, 134
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 296
LDI r11, 161
LDI r12, 36
LDI r13, 80
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
