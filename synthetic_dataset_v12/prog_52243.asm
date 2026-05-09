; DESCRIPTION: Composite: Places a red 106x119 rectangle at position (159, 127) then Renders a orange disk with center (360, 83) and radius 37.
; PLAN: r0=159(x), r1=127(y), r2=106(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=83(y), r7=37(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 159
LDI r1, 127
LDI r2, 106
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 83
LDI r7, 37
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
