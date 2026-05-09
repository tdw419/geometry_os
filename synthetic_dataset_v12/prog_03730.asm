; DESCRIPTION: Composite: Renders a black disk with center (317, 181) and radius 38 then Sets a single magenta pixel at (56, 252) then Renders a cyan box of size 54x62 starting at (373, 91).
; PLAN: r0=317(x), r1=181(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x), r6=252(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=373(x), r11=91(y), r12=54(width), r13=62(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 181
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 252
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 373
LDI r11, 91
LDI r12, 54
LDI r13, 62
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
