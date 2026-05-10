; DESCRIPTION: Composite: Places a orange 112x11 rectangle at position (334, 110) then Places a white dot at position (401, 191).
; PLAN: r0=334(x), r1=110(y), r2=112(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=191(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 334
LDI r1, 110
LDI r2, 112
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 191
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
