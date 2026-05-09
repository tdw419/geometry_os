; DESCRIPTION: Composite: Creates a red rectangular region at (279, 0) spanning 117 by 108 pixels then Places a green dot at position (108, 23).
; PLAN: r0=279(x), r1=0(y), r2=117(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=23(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 279
LDI r1, 0
LDI r2, 117
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 23
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
