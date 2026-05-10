; DESCRIPTION: Composite: Places a purple dot at position (256, 116) then Draws a orange rectangle at (251, 85) with width 104 and height 120.
; PLAN: r0=256(x), r1=116(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=85(y), r7=104(width), r8=120(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 116
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 251
LDI r6, 85
LDI r7, 104
LDI r8, 120
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
