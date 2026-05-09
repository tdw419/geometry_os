; DESCRIPTION: Composite: Renders a purple disk with center (217, 109) and radius 32 then Draws a orange rectangle at (250, 107) with width 16 and height 108.
; PLAN: r0=217(x), r1=109(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=107(y), r7=16(width), r8=108(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 109
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 107
LDI r7, 16
LDI r8, 108
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
