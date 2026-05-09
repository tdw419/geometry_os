; DESCRIPTION: Composite: Renders a black box of size 13x86 starting at (145, 8) then Renders a magenta disk with center (333, 206) and radius 25.
; PLAN: r0=145(x), r1=8(y), r2=13(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x), r6=206(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 145
LDI r1, 8
LDI r2, 13
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 206
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
