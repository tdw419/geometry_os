; DESCRIPTION: Composite: Renders a green disk with center (260, 149) and radius 44 then Draws a purple rectangle at (39, 93) with width 23 and height 113.
; PLAN: r0=260(x), r1=149(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=93(y), r7=23(width), r8=113(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 149
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 93
LDI r7, 23
LDI r8, 113
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
