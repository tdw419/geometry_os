; DESCRIPTION: Composite: Renders a red disk with center (451, 162) and radius 19 then Places a magenta dot at position (217, 230) then Renders a cyan box of size 21x110 starting at (314, 31).
; PLAN: r0=451(x), r1=162(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x), r6=230(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=314(x), r11=31(y), r12=21(width), r13=110(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 162
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 230
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 314
LDI r11, 31
LDI r12, 21
LDI r13, 110
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
