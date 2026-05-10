; DESCRIPTION: Composite: Renders a yellow disk with center (101, 166) and radius 64 then Creates a red rectangular region at (139, 166) spanning 47 by 73 pixels.
; PLAN: r0=101(x), r1=166(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x), r6=166(y), r7=47(width), r8=73(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 166
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 166
LDI r7, 47
LDI r8, 73
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
