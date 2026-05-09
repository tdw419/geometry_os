; DESCRIPTION: Composite: . Then Draws a purple circle centered at (118, 90) with radius 36. Then Renders a purple box of size 25x35 starting at (96, 154).
; PLAN: r0=118(x), r1=90(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=96(x), r1=154(y), r2=25(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (118, 90) with radius 36.
; PLAN: r0=118(x), r1=90(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 90
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple box of size 25x35 starting at (96, 154).
; PLAN: r0=96(x), r1=154(y), r2=25(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 154
LDI r2, 25
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
