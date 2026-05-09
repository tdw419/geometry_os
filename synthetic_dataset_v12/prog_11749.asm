; DESCRIPTION: Composite: Places a purple dot at position (69, 193) then Draws a green rectangle at (314, 112) with width 82 and height 69.
; PLAN: r0=69(x), r1=193(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=112(y), r7=82(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 193
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 314
LDI r6, 112
LDI r7, 82
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
