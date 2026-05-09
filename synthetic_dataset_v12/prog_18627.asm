; DESCRIPTION: Composite: Draws a blue circle centered at (199, 82) with radius 25 then Places a yellow 108x79 rectangle at position (66, 157).
; PLAN: r0=199(x), r1=82(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x), r6=157(y), r7=108(width), r8=79(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 82
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 157
LDI r7, 108
LDI r8, 79
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
