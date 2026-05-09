; DESCRIPTION: Composite: Creates a red circular shape at (347, 125) with radius 35 then Places a red 35x98 rectangle at position (196, 138).
; PLAN: r0=347(x), r1=125(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=196(x), r6=138(y), r7=35(width), r8=98(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 125
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 196
LDI r6, 138
LDI r7, 35
LDI r8, 98
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
