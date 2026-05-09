; DESCRIPTION: Composite: Places a cyan dot at position (261, 223) then Places a blue circle of radius 32 at center (210, 58) then Renders a blue box of size 22x78 starting at (160, 95).
; PLAN: r0=261(x), r1=223(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=58(y), r7=32(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=160(x), r11=95(y), r12=22(width), r13=78(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 261
LDI r1, 223
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 210
LDI r6, 58
LDI r7, 32
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 160
LDI r11, 95
LDI r12, 22
LDI r13, 78
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
