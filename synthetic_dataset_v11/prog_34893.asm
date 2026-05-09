; DESCRIPTION: Composite: . Then Draws a red circle centered at (197, 179) with radius 58. Then Renders a blue box of size 33x72 starting at (97, 124).
; PLAN: r0=197(x), r1=179(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=97(x), r1=124(y), r2=33(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (197, 179) with radius 58.
; PLAN: r0=197(x), r1=179(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 179
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue box of size 33x72 starting at (97, 124).
; PLAN: r0=97(x), r1=124(y), r2=33(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 124
LDI r2, 33
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
