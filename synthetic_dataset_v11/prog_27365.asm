; DESCRIPTION: Composite: . Then Draws a purple rectangle at (65, 107) with width 36 and height 108. Then Draws a green circle centered at (213, 104) with radius 40.
; PLAN: r0=65(x), r1=107(y), r2=36(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=213(x), r1=104(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple rectangle at (65, 107) with width 36 and height 108.
; PLAN: r0=65(x), r1=107(y), r2=36(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 107
LDI r2, 36
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (213, 104) with radius 40.
; PLAN: r0=213(x), r1=104(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 104
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
