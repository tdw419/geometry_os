; DESCRIPTION: Composite: Renders a yellow box of size 70x111 starting at (280, 139) then Places a yellow circle of radius 58 at center (233, 184).
; PLAN: r0=280(x), r1=139(y), r2=70(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=184(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 280
LDI r1, 139
LDI r2, 70
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 184
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
