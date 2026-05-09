; DESCRIPTION: Composite: Creates a red rectangular region at (28, 38) spanning 60 by 103 pixels then Places a red circle of radius 49 at center (141, 63) then Places a black dot at position (96, 120).
; PLAN: r0=28(x), r1=38(y), r2=60(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=63(y), r7=49(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=96(x), r11=120(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 28
LDI r1, 38
LDI r2, 60
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 63
LDI r7, 49
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 96
LDI r11, 120
LDI r12, 0x000000
PSET r10, r11, r12
HALT
