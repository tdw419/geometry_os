; DESCRIPTION: Composite: Places a red 59x39 rectangle at position (450, 76) then Places a black dot at position (280, 108) then Renders a purple disk with center (138, 89) and radius 67.
; PLAN: r0=450(x), r1=76(y), r2=59(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=108(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=138(x), r11=89(y), r12=67(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 450
LDI r1, 76
LDI r2, 59
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 108
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 138
LDI r11, 89
LDI r12, 67
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
