; DESCRIPTION: Composite: Creates a blue rectangular region at (21, 100) spanning 98 by 14 pixels then Places a red dot at position (479, 58).
; PLAN: r0=21(x), r1=100(y), r2=98(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=479(x), r6=58(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 21
LDI r1, 100
LDI r2, 98
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 58
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
