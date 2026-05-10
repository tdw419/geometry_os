; DESCRIPTION: Composite: Creates a black rectangular region at (409, 128) spanning 33 by 17 pixels then Sets a single orange pixel at (422, 205).
; PLAN: r0=409(x), r1=128(y), r2=33(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=205(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 409
LDI r1, 128
LDI r2, 33
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 205
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
