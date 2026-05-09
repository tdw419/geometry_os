; DESCRIPTION: Composite: Creates a orange circular shape at (408, 188) with radius 46 then Draws a cyan rectangle at (406, 87) with width 50 and height 16.
; PLAN: r0=408(x), r1=188(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=87(y), r7=50(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 188
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 87
LDI r7, 50
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
