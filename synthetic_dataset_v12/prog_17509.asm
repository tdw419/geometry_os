; DESCRIPTION: Composite: Places a white 49x52 rectangle at position (214, 43) then Places a orange dot at position (185, 68).
; PLAN: r0=214(x), r1=43(y), r2=49(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x), r6=68(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 214
LDI r1, 43
LDI r2, 49
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 68
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
