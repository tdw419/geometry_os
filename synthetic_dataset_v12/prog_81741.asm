; DESCRIPTION: Composite: Places a white circle of radius 32 at center (143, 142) then Draws a cyan rectangle at (367, 50) with width 103 and height 104.
; PLAN: r0=143(x), r1=142(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=50(y), r7=103(width), r8=104(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 142
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 50
LDI r7, 103
LDI r8, 104
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
