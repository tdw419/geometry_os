; DESCRIPTION: Composite: Places a blue dot at position (263, 250) then Draws a blue rectangle at (255, 62) with width 85 and height 52.
; PLAN: r0=263(x), r1=250(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=62(y), r7=85(width), r8=52(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 250
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 255
LDI r6, 62
LDI r7, 85
LDI r8, 52
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
