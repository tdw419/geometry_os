; DESCRIPTION: Composite: Creates a red rectangular region at (159, 212) spanning 15 by 21 pixels then Places a cyan circle of radius 80 at center (231, 121).
; PLAN: r0=159(x), r1=212(y), r2=15(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=121(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 159
LDI r1, 212
LDI r2, 15
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 121
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
