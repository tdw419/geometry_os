; DESCRIPTION: Composite: Places a purple 29x84 rectangle at position (274, 155) then Places a yellow dot at position (104, 91).
; PLAN: r0=274(x), r1=155(y), r2=29(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=91(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 274
LDI r1, 155
LDI r2, 29
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 91
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
