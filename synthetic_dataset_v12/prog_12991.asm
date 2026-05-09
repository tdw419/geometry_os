; DESCRIPTION: Composite: Renders a white box of size 51x16 starting at (72, 134) then Places a black circle of radius 24 at center (60, 90).
; PLAN: r0=72(x), r1=134(y), r2=51(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=90(y), r7=24(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 72
LDI r1, 134
LDI r2, 51
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 90
LDI r7, 24
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
