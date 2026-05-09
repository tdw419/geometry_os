; DESCRIPTION: Composite: Creates a green circular shape at (306, 194) with radius 18 then Places a green 25x20 rectangle at position (399, 167).
; PLAN: r0=306(x), r1=194(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=399(x), r6=167(y), r7=25(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 194
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 399
LDI r6, 167
LDI r7, 25
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
