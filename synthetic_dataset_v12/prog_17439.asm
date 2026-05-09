; DESCRIPTION: Composite: Creates a cyan circular shape at (176, 154) with radius 69 then Places a yellow 12x18 rectangle at position (210, 100).
; PLAN: r0=176(x), r1=154(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x), r6=100(y), r7=12(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 154
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 100
LDI r7, 12
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
