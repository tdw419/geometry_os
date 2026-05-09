; DESCRIPTION: Composite: Renders a magenta disk with center (420, 131) and radius 61 then Sets a single cyan pixel at (450, 123) then Renders a orange box of size 81x32 starting at (378, 58).
; PLAN: r0=420(x), r1=131(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x), r6=123(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=378(x), r11=58(y), r12=81(width), r13=32(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 420
LDI r1, 131
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 123
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 378
LDI r11, 58
LDI r12, 81
LDI r13, 32
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
