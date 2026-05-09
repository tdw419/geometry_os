; DESCRIPTION: Composite: Draws a white circle centered at (204, 93) with radius 71 then Places a white 104x43 rectangle at position (37, 120).
; PLAN: r0=204(x), r1=93(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=120(y), r7=104(width), r8=43(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 93
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 120
LDI r7, 104
LDI r8, 43
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
