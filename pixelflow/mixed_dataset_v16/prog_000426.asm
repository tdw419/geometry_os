; DESCRIPTION: Composite: Places a black circle of radius 24 at center (215, 188) then Creates a cyan rectangular region at (108, 83) spanning 26 by 87 pixels.
; PLAN: r0=215(x), r1=188(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=83(y), r7=26(width), r8=87(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 188
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 83
LDI r7, 26
LDI r8, 87
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
