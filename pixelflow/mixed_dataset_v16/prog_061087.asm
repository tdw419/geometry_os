; DESCRIPTION: Composite: Draws a orange circle centered at (168, 120) with radius 13 then Places a magenta 107x19 rectangle at position (241, 16).
; PLAN: r0=168(x), r1=120(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=16(y), r7=107(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 120
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 16
LDI r7, 107
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
