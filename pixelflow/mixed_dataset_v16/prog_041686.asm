; DESCRIPTION: Composite: Renders a magenta box of size 13x111 starting at (71, 48) then Draws a magenta circle centered at (187, 200) with radius 40.
; PLAN: r0=71(x), r1=48(y), r2=13(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=200(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 71
LDI r1, 48
LDI r2, 13
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 200
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
