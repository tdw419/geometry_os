; DESCRIPTION: Composite: Places a white 21x38 rectangle at position (263, 39) then Draws a green circle centered at (266, 123) with radius 29.
; PLAN: r0=263(x), r1=39(y), r2=21(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=123(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 39
LDI r2, 21
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 123
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
