; DESCRIPTION: Composite: Places a orange 49x60 rectangle at position (161, 100) then Places a red circle of radius 71 at center (96, 106).
; PLAN: r0=161(x), r1=100(y), r2=49(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x), r6=106(y), r7=71(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 161
LDI r1, 100
LDI r2, 49
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 106
LDI r7, 71
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
