; DESCRIPTION: Composite: Draws a cyan rectangle at (202, 150) with width 63 and height 72 then Creates a magenta circular shape at (57, 64) with radius 25.
; PLAN: r0=202(x), r1=150(y), r2=63(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x), r6=64(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 202
LDI r1, 150
LDI r2, 63
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 64
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
