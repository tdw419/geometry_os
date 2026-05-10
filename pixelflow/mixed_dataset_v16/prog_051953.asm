; DESCRIPTION: Composite: Places a magenta circle of radius 15 at center (346, 90) then Places a red 12x74 rectangle at position (61, 39) then Places a purple dot at position (35, 212).
; PLAN: r0=346(x), r1=90(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x), r6=39(y), r7=12(width), r8=74(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=35(x), r11=212(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 346
LDI r1, 90
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 39
LDI r7, 12
LDI r8, 74
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 212
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
