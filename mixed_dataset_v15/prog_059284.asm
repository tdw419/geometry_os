; DESCRIPTION: Composite: Sets a single orange pixel at (436, 188) then Draws a cyan rectangle at (242, 2) with width 26 and height 81.
; PLAN: r0=436(x), r1=188(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=2(y), r7=26(width), r8=81(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 188
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 242
LDI r6, 2
LDI r7, 26
LDI r8, 81
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
