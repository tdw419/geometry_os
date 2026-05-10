; DESCRIPTION: Composite: Creates a magenta rectangular region at (443, 132) spanning 65 by 60 pixels then Places a orange circle of radius 53 at center (342, 135).
; PLAN: r0=443(x), r1=132(y), r2=65(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=135(y), r7=53(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 443
LDI r1, 132
LDI r2, 65
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 135
LDI r7, 53
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
