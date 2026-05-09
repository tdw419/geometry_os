; DESCRIPTION: Composite: Sets a single white pixel at (221, 68) then Draws a black rectangle at (298, 193) with width 119 and height 26.
; PLAN: r0=221(x), r1=68(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=298(x), r6=193(y), r7=119(width), r8=26(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 68
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 298
LDI r6, 193
LDI r7, 119
LDI r8, 26
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
