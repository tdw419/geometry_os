; DESCRIPTION: Composite: Places a green dot at position (163, 190) then Renders a red disk with center (112, 150) and radius 48 then Renders a yellow box of size 76x89 starting at (132, 32).
; PLAN: r0=163(x), r1=190(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=150(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=132(x), r11=32(y), r12=76(width), r13=89(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 190
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 112
LDI r6, 150
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 132
LDI r11, 32
LDI r12, 76
LDI r13, 89
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
