; DESCRIPTION: Composite: Places a white circle of radius 38 at center (333, 78) then Draws a orange rectangle at (186, 104) with width 75 and height 64.
; PLAN: r0=333(x), r1=78(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=104(y), r7=75(width), r8=64(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 78
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 104
LDI r7, 75
LDI r8, 64
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
