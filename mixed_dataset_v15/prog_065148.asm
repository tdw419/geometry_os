; DESCRIPTION: Composite: Places a red 12x35 rectangle at position (185, 173) then Renders a magenta disk with center (84, 74) and radius 68.
; PLAN: r0=185(x), r1=173(y), r2=12(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x), r6=74(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 185
LDI r1, 173
LDI r2, 12
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 74
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
