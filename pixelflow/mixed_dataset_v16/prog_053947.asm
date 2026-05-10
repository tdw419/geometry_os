; DESCRIPTION: Composite: Renders a black box of size 65x117 starting at (299, 13) then Sets a single black pixel at (198, 179).
; PLAN: r0=299(x), r1=13(y), r2=65(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=179(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 299
LDI r1, 13
LDI r2, 65
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 179
LDI r7, 0x000000
PSET r5, r6, r7
HALT
