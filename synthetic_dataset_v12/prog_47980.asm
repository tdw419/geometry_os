; DESCRIPTION: Composite: Renders a green box of size 91x111 starting at (195, 10) then Places a magenta circle of radius 10 at center (19, 152).
; PLAN: r0=195(x), r1=10(y), r2=91(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x), r6=152(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 195
LDI r1, 10
LDI r2, 91
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 152
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
