; DESCRIPTION: Composite: Creates a yellow rectangular region at (70, 159) spanning 117 by 45 pixels then Draws a cyan circle centered at (286, 166) with radius 72.
; PLAN: r0=70(x), r1=159(y), r2=117(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x), r6=166(y), r7=72(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 70
LDI r1, 159
LDI r2, 117
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 166
LDI r7, 72
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
