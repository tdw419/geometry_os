; DESCRIPTION: Composite: Places a blue 119x18 rectangle at position (42, 62) then Places a cyan dot at position (343, 62) then Places a blue line segment connecting (397, 53) to (53, 95).
; PLAN: r0=42(x), r1=62(y), r2=119(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x), r6=62(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=397(x1), r11=53(y1), r12=53(x2), r13=95(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 62
LDI r2, 119
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 62
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 397
LDI r11, 53
LDI r12, 53
LDI r13, 95
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
