; DESCRIPTION: Composite: Sets a single orange pixel at (86, 219) then Renders a magenta disk with center (319, 131) and radius 80 then Places a orange 98x67 rectangle at position (167, 161).
; PLAN: r0=86(x), r1=219(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=131(y), r7=80(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=167(x), r11=161(y), r12=98(width), r13=67(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 219
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 319
LDI r6, 131
LDI r7, 80
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 167
LDI r11, 161
LDI r12, 98
LDI r13, 67
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
