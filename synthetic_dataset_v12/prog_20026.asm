; DESCRIPTION: Composite: Draws a orange rectangle at (271, 5) with width 61 and height 82 then Places a magenta dot at position (130, 55).
; PLAN: r0=271(x), r1=5(y), r2=61(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=55(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 5
LDI r2, 61
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 55
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
