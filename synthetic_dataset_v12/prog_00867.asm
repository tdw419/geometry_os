; DESCRIPTION: Composite: Sets a single cyan pixel at (372, 180) then Draws a cyan rectangle at (7, 54) with width 109 and height 92.
; PLAN: r0=372(x), r1=180(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=7(x), r6=54(y), r7=109(width), r8=92(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 180
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 7
LDI r6, 54
LDI r7, 109
LDI r8, 92
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
