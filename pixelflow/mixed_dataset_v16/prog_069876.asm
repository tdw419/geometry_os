; DESCRIPTION: Composite: Renders a cyan box of size 119x29 starting at (301, 150) then Creates a red circular shape at (329, 43) with radius 12.
; PLAN: r0=301(x), r1=150(y), r2=119(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=43(y), r7=12(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 150
LDI r2, 119
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 43
LDI r7, 12
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
