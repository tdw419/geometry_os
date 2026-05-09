; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (183, 66) with radius 56. Then Draws a cyan rectangle at (144, 58) with width 30 and height 52.
; PLAN: r0=183(x), r1=66(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=144(x), r1=58(y), r2=30(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (183, 66) with radius 56.
; PLAN: r0=183(x), r1=66(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 66
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan rectangle at (144, 58) with width 30 and height 52.
; PLAN: r0=144(x), r1=58(y), r2=30(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 58
LDI r2, 30
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
