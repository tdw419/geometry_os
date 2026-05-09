; DESCRIPTION: Composite: Places a red dot at position (301, 56) then Draws a white rectangle at (464, 79) with width 14 and height 43.
; PLAN: r0=301(x), r1=56(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=464(x), r6=79(y), r7=14(width), r8=43(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 56
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 464
LDI r6, 79
LDI r7, 14
LDI r8, 43
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
