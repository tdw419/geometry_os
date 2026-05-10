; DESCRIPTION: Composite: Renders a yellow disk with center (110, 225) and radius 30 then Places a yellow 44x44 rectangle at position (453, 84).
; PLAN: r0=110(x), r1=225(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=453(x), r6=84(y), r7=44(width), r8=44(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 225
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 453
LDI r6, 84
LDI r7, 44
LDI r8, 44
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
