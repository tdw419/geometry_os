; DESCRIPTION: Composite: Sets a single cyan pixel at (360, 178) then Draws a yellow rectangle at (39, 51) with width 26 and height 51.
; PLAN: r0=360(x), r1=178(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=39(x), r6=51(y), r7=26(width), r8=51(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 178
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 39
LDI r6, 51
LDI r7, 26
LDI r8, 51
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
