; DESCRIPTION: Composite: Creates a black rectangular region at (304, 204) spanning 70 by 50 pixels then Places a blue dot at position (269, 190) then Renders a blue disk with center (274, 134) and radius 30.
; PLAN: r0=304(x), r1=204(y), r2=70(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=269(x), r6=190(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=274(x), r11=134(y), r12=30(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 304
LDI r1, 204
LDI r2, 70
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 190
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 274
LDI r11, 134
LDI r12, 30
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
