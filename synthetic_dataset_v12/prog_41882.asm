; DESCRIPTION: Composite: Places a green 37x70 rectangle at position (378, 65) then Draws a cyan circle centered at (244, 69) with radius 10.
; PLAN: r0=378(x), r1=65(y), r2=37(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=69(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 378
LDI r1, 65
LDI r2, 37
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 69
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
