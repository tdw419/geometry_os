; DESCRIPTION: Composite: Renders a magenta box of size 105x59 starting at (113, 163) then Draws a red circle centered at (267, 117) with radius 61.
; PLAN: r0=113(x), r1=163(y), r2=105(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x), r6=117(y), r7=61(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 113
LDI r1, 163
LDI r2, 105
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 117
LDI r7, 61
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
