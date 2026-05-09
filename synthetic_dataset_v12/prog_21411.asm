; DESCRIPTION: Composite: Places a white circle of radius 69 at center (262, 118) then Places a red 44x32 rectangle at position (155, 138).
; PLAN: r0=262(x), r1=118(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x), r6=138(y), r7=44(width), r8=32(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 118
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 138
LDI r7, 44
LDI r8, 32
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
