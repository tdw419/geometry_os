; DESCRIPTION: Composite: Sets a single white pixel at (164, 28) then Places a magenta 90x38 rectangle at position (209, 7).
; PLAN: r0=164(x), r1=28(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=209(x), r6=7(y), r7=90(width), r8=38(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 28
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 7
LDI r7, 90
LDI r8, 38
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
