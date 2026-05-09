; DESCRIPTION: Composite: Renders a white box of size 21x46 starting at (375, 202) then Places a white dot at position (442, 25).
; PLAN: r0=375(x), r1=202(y), r2=21(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=25(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 375
LDI r1, 202
LDI r2, 21
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 25
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
