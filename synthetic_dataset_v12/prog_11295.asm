; DESCRIPTION: Composite: Sets a single white pixel at (404, 30) then Draws a yellow rectangle at (269, 30) with width 100 and height 45.
; PLAN: r0=404(x), r1=30(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=30(y), r7=100(width), r8=45(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 30
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 269
LDI r6, 30
LDI r7, 100
LDI r8, 45
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
