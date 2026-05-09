; DESCRIPTION: Composite: Draws a cyan circle centered at (28, 90) with radius 11 then Places a cyan 67x37 rectangle at position (39, 134).
; PLAN: r0=28(x), r1=90(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=134(y), r7=67(width), r8=37(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 28
LDI r1, 90
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 134
LDI r7, 67
LDI r8, 37
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
