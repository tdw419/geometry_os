; DESCRIPTION: Composite: Sets a single cyan pixel at (331, 196) then Draws a red rectangle at (68, 19) with width 78 and height 65.
; PLAN: r0=331(x), r1=196(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=19(y), r7=78(width), r8=65(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 196
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 68
LDI r6, 19
LDI r7, 78
LDI r8, 65
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
