; DESCRIPTION: Composite: Creates a white circular shape at (313, 199) with radius 54 then Places a white 99x71 rectangle at position (163, 171).
; PLAN: r0=313(x), r1=199(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=171(y), r7=99(width), r8=71(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 199
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 171
LDI r7, 99
LDI r8, 71
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
