; DESCRIPTION: Composite: Sets a single white pixel at (38, 93) then Places a yellow 69x61 rectangle at position (166, 92).
; PLAN: r0=38(x), r1=93(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=92(y), r7=69(width), r8=61(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 38
LDI r1, 93
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 166
LDI r6, 92
LDI r7, 69
LDI r8, 61
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
