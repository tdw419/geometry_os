; DESCRIPTION: Composite: Draws a white rectangle at (32, 89) with width 120 and height 96 then Renders a green disk with center (186, 82) and radius 58.
; PLAN: r0=32(x), r1=89(y), r2=120(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x), r6=82(y), r7=58(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 32
LDI r1, 89
LDI r2, 120
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 82
LDI r7, 58
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
