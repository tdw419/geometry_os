; DESCRIPTION: Composite: Places a black 19x57 rectangle at position (373, 38) then Places a purple dot at position (186, 229) then Places a yellow circle of radius 62 at center (110, 83).
; PLAN: r0=373(x), r1=38(y), r2=19(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x), r6=229(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=110(x), r11=83(y), r12=62(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 373
LDI r1, 38
LDI r2, 19
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 229
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 110
LDI r11, 83
LDI r12, 62
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
