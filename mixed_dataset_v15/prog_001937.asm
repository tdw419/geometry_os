; DESCRIPTION: Composite: Renders a orange box of size 45x53 starting at (435, 139) then Creates a red circular shape at (164, 177) with radius 57.
; PLAN: r0=435(x), r1=139(y), r2=45(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=177(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 435
LDI r1, 139
LDI r2, 45
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 177
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
