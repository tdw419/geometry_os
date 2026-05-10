; DESCRIPTION: Composite: Renders a white disk with center (45, 176) and radius 42 then Places a red 113x42 rectangle at position (222, 98).
; PLAN: r0=45(x), r1=176(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x), r6=98(y), r7=113(width), r8=42(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 176
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 98
LDI r7, 113
LDI r8, 42
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
