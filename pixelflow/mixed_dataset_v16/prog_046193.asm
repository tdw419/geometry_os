; DESCRIPTION: Composite: Renders a orange disk with center (41, 161) and radius 22 then Places a purple 59x26 rectangle at position (439, 122).
; PLAN: r0=41(x), r1=161(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=122(y), r7=59(width), r8=26(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 161
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 122
LDI r7, 59
LDI r8, 26
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
