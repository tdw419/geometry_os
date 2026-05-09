; DESCRIPTION: Composite: Draws a yellow circle centered at (138, 68) with radius 65 then Renders a yellow box of size 71x46 starting at (379, 151).
; PLAN: r0=138(x), r1=68(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=151(y), r7=71(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 68
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 151
LDI r7, 71
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
