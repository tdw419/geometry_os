; DESCRIPTION: Composite: Places a white 24x57 rectangle at position (352, 67) then Renders a white disk with center (154, 157) and radius 17.
; PLAN: r0=352(x), r1=67(y), r2=24(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=157(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 352
LDI r1, 67
LDI r2, 24
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 157
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
