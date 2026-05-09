; DESCRIPTION: Composite: Creates a cyan circular shape at (313, 22) with radius 11 then Places a cyan 95x95 rectangle at position (85, 113).
; PLAN: r0=313(x), r1=22(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=113(y), r7=95(width), r8=95(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 22
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 113
LDI r7, 95
LDI r8, 95
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
