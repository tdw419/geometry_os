; DESCRIPTION: Composite: Sets a single magenta pixel at (171, 184) then Draws a blue rectangle at (415, 123) with width 28 and height 50.
; PLAN: r0=171(x), r1=184(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=123(y), r7=28(width), r8=50(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 184
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 415
LDI r6, 123
LDI r7, 28
LDI r8, 50
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
