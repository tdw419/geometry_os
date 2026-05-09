; DESCRIPTION: Composite: Places a white dot at position (233, 168) then Draws a green rectangle at (58, 88) with width 99 and height 104.
; PLAN: r0=233(x), r1=168(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=58(x), r6=88(y), r7=99(width), r8=104(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 168
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 58
LDI r6, 88
LDI r7, 99
LDI r8, 104
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
