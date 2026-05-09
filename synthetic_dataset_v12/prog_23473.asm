; DESCRIPTION: Composite: Creates a black rectangular region at (258, 73) spanning 20 by 21 pixels then Sets a single orange pixel at (502, 67).
; PLAN: r0=258(x), r1=73(y), r2=20(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=502(x), r6=67(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 258
LDI r1, 73
LDI r2, 20
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 67
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
