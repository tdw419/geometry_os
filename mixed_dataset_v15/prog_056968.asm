; DESCRIPTION: Composite: Draws a purple rectangle at (220, 120) with width 11 and height 113 then Places a green circle of radius 50 at center (377, 168).
; PLAN: r0=220(x), r1=120(y), r2=11(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x), r6=168(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 220
LDI r1, 120
LDI r2, 11
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 168
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
