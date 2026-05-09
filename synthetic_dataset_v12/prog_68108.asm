; DESCRIPTION: Composite: Renders a black disk with center (145, 214) and radius 42 then Draws a cyan rectangle at (309, 31) with width 82 and height 33.
; PLAN: r0=145(x), r1=214(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=31(y), r7=82(width), r8=33(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 214
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 31
LDI r7, 82
LDI r8, 33
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
