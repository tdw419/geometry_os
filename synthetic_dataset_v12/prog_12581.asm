; DESCRIPTION: Composite: Draws a magenta circle centered at (178, 177) with radius 40 then Renders a purple box of size 106x50 starting at (110, 48).
; PLAN: r0=178(x), r1=177(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=110(x), r6=48(y), r7=106(width), r8=50(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 177
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 110
LDI r6, 48
LDI r7, 106
LDI r8, 50
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
