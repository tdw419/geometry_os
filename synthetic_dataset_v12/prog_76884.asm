; DESCRIPTION: Composite: Renders a purple box of size 117x71 starting at (144, 102) then Places a magenta dot at position (299, 102) then Places a red circle of radius 57 at center (425, 61).
; PLAN: r0=144(x), r1=102(y), r2=117(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=102(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=425(x), r11=61(y), r12=57(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 144
LDI r1, 102
LDI r2, 117
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 102
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 425
LDI r11, 61
LDI r12, 57
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
