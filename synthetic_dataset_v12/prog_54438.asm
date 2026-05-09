; DESCRIPTION: Composite: Places a magenta dot at position (48, 108) then Draws a magenta rectangle at (433, 38) with width 53 and height 110.
; PLAN: r0=48(x), r1=108(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=433(x), r6=38(y), r7=53(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 108
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 433
LDI r6, 38
LDI r7, 53
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
