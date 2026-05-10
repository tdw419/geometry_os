; DESCRIPTION: Composite: Places a magenta dot at position (247, 226) then Renders a orange disk with center (93, 87) and radius 24 then Renders a yellow box of size 26x107 starting at (117, 56).
; PLAN: r0=247(x), r1=226(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=93(x), r6=87(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x), r11=56(y), r12=26(width), r13=107(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 226
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 93
LDI r6, 87
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 56
LDI r12, 26
LDI r13, 107
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
