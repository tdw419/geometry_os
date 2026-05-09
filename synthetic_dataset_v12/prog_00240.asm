; DESCRIPTION: Composite: Renders a black disk with center (269, 151) and radius 73 then Renders a yellow box of size 32x30 starting at (115, 178).
; PLAN: r0=269(x), r1=151(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x), r6=178(y), r7=32(width), r8=30(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 151
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 178
LDI r7, 32
LDI r8, 30
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
