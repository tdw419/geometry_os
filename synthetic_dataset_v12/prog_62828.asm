; DESCRIPTION: Composite: Places a yellow 77x97 rectangle at position (416, 55) then Sets a single green pixel at (485, 18).
; PLAN: r0=416(x), r1=55(y), r2=77(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x), r6=18(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 416
LDI r1, 55
LDI r2, 77
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 18
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
