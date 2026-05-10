; DESCRIPTION: Composite: Creates a white circular shape at (322, 84) with radius 71 then Places a white 29x68 rectangle at position (210, 81).
; PLAN: r0=322(x), r1=84(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x), r6=81(y), r7=29(width), r8=68(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 84
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 81
LDI r7, 29
LDI r8, 68
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
