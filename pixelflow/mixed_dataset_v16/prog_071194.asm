; DESCRIPTION: Composite: Places a orange circle of radius 76 at center (296, 121) then Places a green 84x112 rectangle at position (247, 73).
; PLAN: r0=296(x), r1=121(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=247(x), r6=73(y), r7=84(width), r8=112(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 121
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 247
LDI r6, 73
LDI r7, 84
LDI r8, 112
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
