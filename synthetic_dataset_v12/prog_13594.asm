; DESCRIPTION: Composite: Creates a black circular shape at (259, 186) with radius 13 then Places a cyan dot at position (97, 212) then Draws a cyan rectangle at (197, 196) with width 100 and height 27.
; PLAN: r0=259(x), r1=186(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=212(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=197(x), r11=196(y), r12=100(width), r13=27(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 186
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 212
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 197
LDI r11, 196
LDI r12, 100
LDI r13, 27
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
