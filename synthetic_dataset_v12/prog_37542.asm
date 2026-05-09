; DESCRIPTION: Composite: Places a yellow circle of radius 13 at center (85, 98) then Creates a red rectangular region at (401, 32) spanning 53 by 29 pixels.
; PLAN: r0=85(x), r1=98(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=32(y), r7=53(width), r8=29(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 98
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 32
LDI r7, 53
LDI r8, 29
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
