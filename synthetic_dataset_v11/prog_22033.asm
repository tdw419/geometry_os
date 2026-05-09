; DESCRIPTION: Composite: . Then Draws a red circle centered at (86, 47) with radius 43. Then Renders a yellow box of size 114x100 starting at (70, 77).
; PLAN: r0=86(x), r1=47(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=70(x), r1=77(y), r2=114(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (86, 47) with radius 43.
; PLAN: r0=86(x), r1=47(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 47
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow box of size 114x100 starting at (70, 77).
; PLAN: r0=70(x), r1=77(y), r2=114(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 77
LDI r2, 114
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
