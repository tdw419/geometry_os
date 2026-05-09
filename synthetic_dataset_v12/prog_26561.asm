; DESCRIPTION: Composite: Sets a single orange pixel at (446, 254) then Draws a green rectangle at (364, 38) with width 43 and height 103.
; PLAN: r0=446(x), r1=254(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=38(y), r7=43(width), r8=103(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 254
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 364
LDI r6, 38
LDI r7, 43
LDI r8, 103
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
