; DESCRIPTION: Composite: Places a magenta 71x34 rectangle at position (90, 45) then Places a blue circle of radius 57 at center (444, 173).
; PLAN: r0=90(x), r1=45(y), r2=71(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x), r6=173(y), r7=57(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 90
LDI r1, 45
LDI r2, 71
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 173
LDI r7, 57
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
