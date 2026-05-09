; DESCRIPTION: Composite: Sets a single blue pixel at (281, 102) then Creates a green circular shape at (214, 192) with radius 57 then Renders a red box of size 117x115 starting at (221, 106).
; PLAN: r0=281(x), r1=102(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=192(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=221(x), r11=106(y), r12=117(width), r13=115(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 102
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 214
LDI r6, 192
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 221
LDI r11, 106
LDI r12, 117
LDI r13, 115
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
