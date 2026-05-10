; DESCRIPTION: Composite: Places a white dot at position (174, 168) then Creates a yellow circular shape at (418, 123) with radius 57 then Draws a yellow line from (160, 123) to (160, 27).
; PLAN: r0=174(x), r1=168(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=123(y), r7=57(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=160(x1), r11=123(y1), r12=160(x2), r13=27(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 168
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 418
LDI r6, 123
LDI r7, 57
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 160
LDI r11, 123
LDI r12, 160
LDI r13, 27
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
