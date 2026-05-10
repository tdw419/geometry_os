; DESCRIPTION: Composite: Places a red 45x22 rectangle at position (377, 154) then Creates a red circular shape at (149, 87) with radius 58 then Sets a single purple pixel at (228, 165).
; PLAN: r0=377(x), r1=154(y), r2=45(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=87(y), r7=58(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=228(x), r11=165(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 377
LDI r1, 154
LDI r2, 45
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 87
LDI r7, 58
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 228
LDI r11, 165
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
