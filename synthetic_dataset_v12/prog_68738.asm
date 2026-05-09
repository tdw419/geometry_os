; DESCRIPTION: Composite: Renders a red box of size 49x103 starting at (379, 61) then Places a yellow circle of radius 20 at center (255, 131).
; PLAN: r0=379(x), r1=61(y), r2=49(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=131(y), r7=20(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 379
LDI r1, 61
LDI r2, 49
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 131
LDI r7, 20
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
