; DESCRIPTION: Composite: Creates a blue circular shape at (419, 107) with radius 78 then Places a magenta dot at position (294, 120) then Renders a purple box of size 50x110 starting at (315, 23).
; PLAN: r0=419(x), r1=107(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=120(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=315(x), r11=23(y), r12=50(width), r13=110(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 107
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 120
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 315
LDI r11, 23
LDI r12, 50
LDI r13, 110
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
