; DESCRIPTION: Composite: Places a orange circle of radius 18 at center (422, 145) then Places a purple 104x82 rectangle at position (326, 12).
; PLAN: r0=422(x), r1=145(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=12(y), r7=104(width), r8=82(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 145
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 12
LDI r7, 104
LDI r8, 82
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
