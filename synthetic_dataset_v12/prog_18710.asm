; DESCRIPTION: Composite: Draws a black circle centered at (433, 133) with radius 73 then Places a red 46x13 rectangle at position (77, 95).
; PLAN: r0=433(x), r1=133(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=95(y), r7=46(width), r8=13(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 133
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 95
LDI r7, 46
LDI r8, 13
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
