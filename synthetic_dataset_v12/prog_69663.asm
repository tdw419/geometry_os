; DESCRIPTION: Composite: Creates a cyan circular shape at (307, 184) with radius 57 then Renders a blue box of size 34x109 starting at (388, 98) then Sets a single yellow pixel at (274, 105).
; PLAN: r0=307(x), r1=184(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=388(x), r6=98(y), r7=34(width), r8=109(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=274(x), r11=105(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 184
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 388
LDI r6, 98
LDI r7, 34
LDI r8, 109
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 105
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
