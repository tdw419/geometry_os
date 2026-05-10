; DESCRIPTION: Composite: Creates a yellow rectangular region at (375, 122) spanning 25 by 21 pixels then Places a magenta dot at position (113, 59).
; PLAN: r0=375(x), r1=122(y), r2=25(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=59(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 375
LDI r1, 122
LDI r2, 25
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 59
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
