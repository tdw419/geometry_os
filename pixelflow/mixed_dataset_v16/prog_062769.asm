; DESCRIPTION: Composite: Creates a cyan circular shape at (103, 94) with radius 39 then Draws a orange rectangle at (404, 213) with width 83 and height 42.
; PLAN: r0=103(x), r1=94(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x), r6=213(y), r7=83(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 94
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 213
LDI r7, 83
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
