; DESCRIPTION: Composite: Places a blue dot at position (145, 245) then Draws a orange rectangle at (367, 55) with width 120 and height 90.
; PLAN: r0=145(x), r1=245(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=55(y), r7=120(width), r8=90(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 245
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 55
LDI r7, 120
LDI r8, 90
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
