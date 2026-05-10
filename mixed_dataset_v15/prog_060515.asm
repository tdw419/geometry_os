; DESCRIPTION: Composite: Renders a yellow disk with center (33, 62) and radius 27 then Places a magenta 61x83 rectangle at position (278, 162).
; PLAN: r0=33(x), r1=62(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=162(y), r7=61(width), r8=83(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 62
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 162
LDI r7, 61
LDI r8, 83
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
