; DESCRIPTION: Composite: Places a orange 20x45 rectangle at position (326, 97) then Draws a red circle centered at (168, 47) with radius 12.
; PLAN: r0=326(x), r1=97(y), r2=20(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x), r6=47(y), r7=12(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 326
LDI r1, 97
LDI r2, 20
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 47
LDI r7, 12
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
