; DESCRIPTION: Composite: . Then Draws a green circle centered at (72, 191) with radius 33. Then Draws a red rectangle at (101, 48) with width 94 and height 103.
; PLAN: r0=72(x), r1=191(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=101(x), r1=48(y), r2=94(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (72, 191) with radius 33.
; PLAN: r0=72(x), r1=191(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 191
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red rectangle at (101, 48) with width 94 and height 103.
; PLAN: r0=101(x), r1=48(y), r2=94(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 48
LDI r2, 94
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
