; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (7, 217) with width 45 and height 15. Then Places a green circle of radius 67 at center (122, 141).
; PLAN: r0=7(x), r1=217(y), r2=45(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=122(x), r1=141(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (7, 217) with width 45 and height 15.
; PLAN: r0=7(x), r1=217(y), r2=45(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 217
LDI r2, 45
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 67 at center (122, 141).
; PLAN: r0=122(x), r1=141(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 141
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
