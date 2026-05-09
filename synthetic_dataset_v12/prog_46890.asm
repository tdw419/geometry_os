; DESCRIPTION: Composite: Renders a green box of size 56x91 starting at (68, 158) then Creates a cyan circular shape at (294, 173) with radius 25 then Sets a single cyan pixel at (472, 59).
; PLAN: r0=68(x), r1=158(y), r2=56(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=173(y), r7=25(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=472(x), r11=59(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 68
LDI r1, 158
LDI r2, 56
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 173
LDI r7, 25
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 472
LDI r11, 59
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
