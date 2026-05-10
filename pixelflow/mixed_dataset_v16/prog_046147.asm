; DESCRIPTION: Composite: Renders a yellow disk with center (274, 60) and radius 35 then Places a blue dot at position (255, 10) then Renders a red box of size 44x50 starting at (37, 139).
; PLAN: r0=274(x), r1=60(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x), r6=10(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=37(x), r11=139(y), r12=44(width), r13=50(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 60
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 10
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 37
LDI r11, 139
LDI r12, 44
LDI r13, 50
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
