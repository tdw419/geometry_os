; DESCRIPTION: Composite: Places a yellow dot at position (475, 108) then Renders a blue disk with center (95, 135) and radius 28 then Places a magenta 90x24 rectangle at position (382, 156).
; PLAN: r0=475(x), r1=108(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=135(y), r7=28(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=382(x), r11=156(y), r12=90(width), r13=24(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 475
LDI r1, 108
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 95
LDI r6, 135
LDI r7, 28
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 382
LDI r11, 156
LDI r12, 90
LDI r13, 24
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
