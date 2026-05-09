; DESCRIPTION: Composite: Creates a red circular shape at (222, 188) with radius 40 then Places a cyan 72x44 rectangle at position (28, 123).
; PLAN: r0=222(x), r1=188(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x), r6=123(y), r7=72(width), r8=44(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 188
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 123
LDI r7, 72
LDI r8, 44
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
