; DESCRIPTION: Composite: Sets a single orange pixel at (477, 39) then Draws a black rectangle at (305, 3) with width 94 and height 16.
; PLAN: r0=477(x), r1=39(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=3(y), r7=94(width), r8=16(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 39
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 305
LDI r6, 3
LDI r7, 94
LDI r8, 16
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
