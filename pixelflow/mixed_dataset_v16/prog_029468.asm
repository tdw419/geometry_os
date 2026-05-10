; DESCRIPTION: Composite: Draws a black circle centered at (434, 96) with radius 63 then Renders a blue box of size 27x103 starting at (308, 71).
; PLAN: r0=434(x), r1=96(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x), r6=71(y), r7=27(width), r8=103(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 96
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 71
LDI r7, 27
LDI r8, 103
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
