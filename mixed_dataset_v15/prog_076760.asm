; DESCRIPTION: Composite: Places a blue dot at position (24, 157) then Places a blue 113x40 rectangle at position (194, 181) then Renders a white disk with center (157, 72) and radius 60.
; PLAN: r0=24(x), r1=157(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=181(y), r7=113(width), r8=40(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=157(x), r11=72(y), r12=60(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 157
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 194
LDI r6, 181
LDI r7, 113
LDI r8, 40
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 72
LDI r12, 60
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
