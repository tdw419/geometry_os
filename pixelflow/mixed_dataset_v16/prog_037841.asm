; DESCRIPTION: Composite: Places a white dot at position (403, 236) then Renders a blue disk with center (407, 202) and radius 49 then Renders a yellow box of size 42x65 starting at (102, 5).
; PLAN: r0=403(x), r1=236(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=202(y), r7=49(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=102(x), r11=5(y), r12=42(width), r13=65(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 403
LDI r1, 236
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 407
LDI r6, 202
LDI r7, 49
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 102
LDI r11, 5
LDI r12, 42
LDI r13, 65
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
