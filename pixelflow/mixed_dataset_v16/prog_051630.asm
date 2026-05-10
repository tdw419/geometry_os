; DESCRIPTION: Composite: Places a purple 56x52 rectangle at position (244, 20) then Places a blue dot at position (103, 201).
; PLAN: r0=244(x), r1=20(y), r2=56(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=201(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 244
LDI r1, 20
LDI r2, 56
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 201
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
