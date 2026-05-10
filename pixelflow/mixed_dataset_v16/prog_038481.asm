; DESCRIPTION: Composite: Places a red circle of radius 30 at center (349, 186) then Places a black dot at position (364, 130) then Renders a purple box of size 61x50 starting at (109, 21).
; PLAN: r0=349(x), r1=186(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x), r6=130(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=109(x), r11=21(y), r12=61(width), r13=50(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 186
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 130
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 109
LDI r11, 21
LDI r12, 61
LDI r13, 50
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
