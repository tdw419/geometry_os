; DESCRIPTION: Composite: . Then Renders a magenta box of size 103x19 starting at (1, 179). Then Draws a yellow circle centered at (158, 190) with radius 36.
; PLAN: r0=1(x), r1=179(y), r2=103(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=158(x), r1=190(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta box of size 103x19 starting at (1, 179).
; PLAN: r0=1(x), r1=179(y), r2=103(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 179
LDI r2, 103
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (158, 190) with radius 36.
; PLAN: r0=158(x), r1=190(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 190
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
