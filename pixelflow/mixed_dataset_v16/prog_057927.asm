; DESCRIPTION: Composite: Renders a white box of size 102x80 starting at (30, 153) then Places a yellow dot at position (296, 81).
; PLAN: r0=30(x), r1=153(y), r2=102(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=296(x), r6=81(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 30
LDI r1, 153
LDI r2, 102
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 81
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
