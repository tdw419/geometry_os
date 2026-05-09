; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (102, 139) with radius 73. Then Renders a purple box of size 67x39 starting at (147, 153).
; PLAN: r0=102(x), r1=139(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=147(x), r1=153(y), r2=67(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (102, 139) with radius 73.
; PLAN: r0=102(x), r1=139(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 139
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple box of size 67x39 starting at (147, 153).
; PLAN: r0=147(x), r1=153(y), r2=67(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 153
LDI r2, 67
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
