; DESCRIPTION: Composite: . Then Draws a red circle centered at (190, 168) with radius 44. Then Renders a magenta box of size 71x96 starting at (18, 47).
; PLAN: r0=190(x), r1=168(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=18(x), r1=47(y), r2=71(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (190, 168) with radius 44.
; PLAN: r0=190(x), r1=168(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 168
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta box of size 71x96 starting at (18, 47).
; PLAN: r0=18(x), r1=47(y), r2=71(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 47
LDI r2, 71
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
