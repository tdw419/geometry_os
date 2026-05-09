; DESCRIPTION: Composite: Draws a blue circle centered at (174, 154) with radius 64 then Renders a cyan box of size 32x109 starting at (349, 112).
; PLAN: r0=174(x), r1=154(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=112(y), r7=32(width), r8=109(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 154
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 112
LDI r7, 32
LDI r8, 109
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
