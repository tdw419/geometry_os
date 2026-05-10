; DESCRIPTION: Composite: Renders a purple disk with center (239, 135) and radius 65 then Places a red 11x82 rectangle at position (222, 83).
; PLAN: r0=239(x), r1=135(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x), r6=83(y), r7=11(width), r8=82(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 135
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 83
LDI r7, 11
LDI r8, 82
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
