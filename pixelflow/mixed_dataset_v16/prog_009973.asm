; DESCRIPTION: Composite: Renders a magenta disk with center (257, 147) and radius 76 then Draws a cyan line from (348, 164) to (385, 120) then Draws a white rectangle at (429, 76) with width 66 and height 70.
; PLAN: r0=257(x), r1=147(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x1), r6=164(y1), r7=385(x2), r8=120(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=429(x), r11=76(y), r12=66(width), r13=70(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 147
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 164
LDI r7, 385
LDI r8, 120
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 76
LDI r12, 66
LDI r13, 70
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
