; DESCRIPTION: Composite: Renders a white box of size 55x114 starting at (437, 101) then Places a white dot at position (165, 196).
; PLAN: r0=437(x), r1=101(y), r2=55(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x), r6=196(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 437
LDI r1, 101
LDI r2, 55
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 196
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
