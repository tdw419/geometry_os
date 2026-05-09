; DESCRIPTION: Composite: . Then Creates a purple circular shape at (108, 187) with radius 46. Then Draws a green rectangle at (186, 96) with width 49 and height 30.
; PLAN: r0=108(x), r1=187(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=186(x), r1=96(y), r2=49(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (108, 187) with radius 46.
; PLAN: r0=108(x), r1=187(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 187
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green rectangle at (186, 96) with width 49 and height 30.
; PLAN: r0=186(x), r1=96(y), r2=49(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 96
LDI r2, 49
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
