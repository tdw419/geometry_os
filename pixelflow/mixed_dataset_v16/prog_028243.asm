; DESCRIPTION: Composite: Sets a single cyan pixel at (312, 16) then Draws a magenta rectangle at (188, 87) with width 104 and height 119.
; PLAN: r0=312(x), r1=16(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=188(x), r6=87(y), r7=104(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 16
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 188
LDI r6, 87
LDI r7, 104
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
