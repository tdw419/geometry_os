; DESCRIPTION: Composite: Places a magenta dot at position (161, 40) then Places a black circle of radius 35 at center (419, 160) then Renders a black box of size 37x24 starting at (74, 107).
; PLAN: r0=161(x), r1=40(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=160(y), r7=35(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=74(x), r11=107(y), r12=37(width), r13=24(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 40
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 419
LDI r6, 160
LDI r7, 35
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 74
LDI r11, 107
LDI r12, 37
LDI r13, 24
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
