; DESCRIPTION: Composite: Sets a single cyan pixel at (33, 111) then Draws a orange rectangle at (382, 78) with width 83 and height 57.
; PLAN: r0=33(x), r1=111(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=78(y), r7=83(width), r8=57(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 111
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 382
LDI r6, 78
LDI r7, 83
LDI r8, 57
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
