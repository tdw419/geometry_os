; DESCRIPTION: Composite: Draws a red circle centered at (141, 150) with radius 64 then Renders a red box of size 38x110 starting at (422, 100) then Places a magenta dot at position (122, 163).
; PLAN: r0=141(x), r1=150(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=100(y), r7=38(width), r8=110(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x), r11=163(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 141
LDI r1, 150
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 100
LDI r7, 38
LDI r8, 110
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 163
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
