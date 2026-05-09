; DESCRIPTION: Composite: Places a white 44x15 rectangle at position (333, 95) then Places a orange circle of radius 46 at center (81, 84).
; PLAN: r0=333(x), r1=95(y), r2=44(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=84(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 333
LDI r1, 95
LDI r2, 44
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 84
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
