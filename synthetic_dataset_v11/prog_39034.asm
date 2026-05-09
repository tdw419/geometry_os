; DESCRIPTION: Composite: . Then Creates a black circular shape at (37, 166) with radius 20. Then Renders a cyan box of size 13x85 starting at (59, 9).
; PLAN: r0=37(x), r1=166(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=59(x), r1=9(y), r2=13(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (37, 166) with radius 20.
; PLAN: r0=37(x), r1=166(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 166
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan box of size 13x85 starting at (59, 9).
; PLAN: r0=59(x), r1=9(y), r2=13(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 9
LDI r2, 13
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
