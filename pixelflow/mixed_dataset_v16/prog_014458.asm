; DESCRIPTION: Composite: Creates a orange circular shape at (207, 168) with radius 69 then Places a red 82x25 rectangle at position (274, 6) then Sets a single purple pixel at (58, 82).
; PLAN: r0=207(x), r1=168(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x), r6=6(y), r7=82(width), r8=25(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=58(x), r11=82(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 207
LDI r1, 168
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 6
LDI r7, 82
LDI r8, 25
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 82
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
