; DESCRIPTION: Composite: Places a magenta circle of radius 70 at center (360, 174) then Creates a magenta rectangular region at (131, 75) spanning 50 by 26 pixels.
; PLAN: r0=360(x), r1=174(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x), r6=75(y), r7=50(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 174
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 75
LDI r7, 50
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
