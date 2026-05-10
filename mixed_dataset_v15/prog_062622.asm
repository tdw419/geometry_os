; DESCRIPTION: Composite: Sets a single orange pixel at (192, 50) then Renders a orange disk with center (91, 204) and radius 24 then Places a magenta 108x80 rectangle at position (313, 139).
; PLAN: r0=192(x), r1=50(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=91(x), r6=204(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x), r11=139(y), r12=108(width), r13=80(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 50
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 91
LDI r6, 204
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 139
LDI r12, 108
LDI r13, 80
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
