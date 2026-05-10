; DESCRIPTION: Composite: Places a purple circle of radius 11 at center (478, 153) then Places a cyan dot at position (364, 53) then Renders a cyan box of size 111x99 starting at (82, 125).
; PLAN: r0=478(x), r1=153(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x), r6=53(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=82(x), r11=125(y), r12=111(width), r13=99(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 478
LDI r1, 153
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 53
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 82
LDI r11, 125
LDI r12, 111
LDI r13, 99
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
