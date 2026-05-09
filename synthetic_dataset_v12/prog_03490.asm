; DESCRIPTION: Composite: Places a red circle of radius 19 at center (50, 187) then Places a black 74x67 rectangle at position (397, 21).
; PLAN: r0=50(x), r1=187(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=21(y), r7=74(width), r8=67(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 187
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 21
LDI r7, 74
LDI r8, 67
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
