; DESCRIPTION: Composite: Sets a single white pixel at (163, 41) then Places a yellow 94x59 rectangle at position (244, 130).
; PLAN: r0=163(x), r1=41(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=244(x), r6=130(y), r7=94(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 41
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 244
LDI r6, 130
LDI r7, 94
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
