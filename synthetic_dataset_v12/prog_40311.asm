; DESCRIPTION: Composite: Places a yellow dot at position (160, 115) then Places a yellow circle of radius 43 at center (257, 125) then Places a red 60x64 rectangle at position (247, 42).
; PLAN: r0=160(x), r1=115(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=125(y), r7=43(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=247(x), r11=42(y), r12=60(width), r13=64(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 115
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 257
LDI r6, 125
LDI r7, 43
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 247
LDI r11, 42
LDI r12, 60
LDI r13, 64
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
