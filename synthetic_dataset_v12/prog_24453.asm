; DESCRIPTION: Composite: Sets a single green pixel at (254, 154) then Draws a cyan rectangle at (59, 46) with width 108 and height 63.
; PLAN: r0=254(x), r1=154(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=46(y), r7=108(width), r8=63(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 154
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 59
LDI r6, 46
LDI r7, 108
LDI r8, 63
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
