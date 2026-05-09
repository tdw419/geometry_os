; DESCRIPTION: Composite: Places a magenta dot at position (62, 171) then Creates a yellow circular shape at (261, 184) with radius 29 then Renders a magenta box of size 107x120 starting at (6, 20).
; PLAN: r0=62(x), r1=171(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=184(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=6(x), r11=20(y), r12=107(width), r13=120(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 171
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 261
LDI r6, 184
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 6
LDI r11, 20
LDI r12, 107
LDI r13, 120
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
