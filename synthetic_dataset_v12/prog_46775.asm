; DESCRIPTION: Composite: Sets a single white pixel at (196, 45) then Draws a orange rectangle at (373, 214) with width 98 and height 18.
; PLAN: r0=196(x), r1=45(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=373(x), r6=214(y), r7=98(width), r8=18(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 45
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 373
LDI r6, 214
LDI r7, 98
LDI r8, 18
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
