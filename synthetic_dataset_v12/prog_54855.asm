; DESCRIPTION: Composite: Places a magenta circle of radius 15 at center (19, 152) then Sets a single blue pixel at (511, 239) then Renders a white box of size 92x113 starting at (413, 46).
; PLAN: r0=19(x), r1=152(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=511(x), r6=239(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=413(x), r11=46(y), r12=92(width), r13=113(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 19
LDI r1, 152
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 511
LDI r6, 239
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 413
LDI r11, 46
LDI r12, 92
LDI r13, 113
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
