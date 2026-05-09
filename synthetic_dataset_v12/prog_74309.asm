; DESCRIPTION: Composite: Places a red 66x56 rectangle at position (109, 171) then Sets a single black pixel at (40, 86) then Renders a cyan disk with center (446, 118) and radius 19.
; PLAN: r0=109(x), r1=171(y), r2=66(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x), r6=86(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=446(x), r11=118(y), r12=19(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 109
LDI r1, 171
LDI r2, 66
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 86
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 446
LDI r11, 118
LDI r12, 19
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
