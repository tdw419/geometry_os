; DESCRIPTION: Composite: Renders a white box of size 31x76 starting at (42, 7) then Places a black dot at position (266, 132) then Places a green line segment connecting (419, 128) to (298, 82).
; PLAN: r0=42(x), r1=7(y), r2=31(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=132(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=419(x1), r11=128(y1), r12=298(x2), r13=82(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 7
LDI r2, 31
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 132
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 419
LDI r11, 128
LDI r12, 298
LDI r13, 82
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
