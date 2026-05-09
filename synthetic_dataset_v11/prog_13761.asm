; DESCRIPTION: Composite: . Then Draws a red rectangle at (12, 95) with width 73 and height 24. Then Renders a magenta disk with center (66, 189) and radius 43.
; PLAN: r0=12(x), r1=95(y), r2=73(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=66(x), r1=189(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red rectangle at (12, 95) with width 73 and height 24.
; PLAN: r0=12(x), r1=95(y), r2=73(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 95
LDI r2, 73
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (66, 189) and radius 43.
; PLAN: r0=66(x), r1=189(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 189
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
