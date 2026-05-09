; DESCRIPTION: Composite: Places a yellow 109x53 rectangle at position (31, 91) then Places a purple circle of radius 61 at center (120, 140) then Sets a single magenta pixel at (307, 228).
; PLAN: r0=31(x), r1=91(y), r2=109(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=140(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x), r11=228(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 31
LDI r1, 91
LDI r2, 109
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 140
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 228
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
