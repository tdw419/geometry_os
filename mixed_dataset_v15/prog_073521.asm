; DESCRIPTION: Composite: Places a blue circle of radius 38 at center (204, 42) then Places a purple 71x20 rectangle at position (414, 160).
; PLAN: r0=204(x), r1=42(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=160(y), r7=71(width), r8=20(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 42
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 160
LDI r7, 71
LDI r8, 20
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
