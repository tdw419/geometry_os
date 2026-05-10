; DESCRIPTION: Composite: Renders a white line between points (397, 168) and (93, 19) then Sets a single green pixel at (325, 88) then Places a white 54x65 rectangle at position (360, 153).
; PLAN: r0=397(x1), r1=168(y1), r2=93(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=88(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=360(x), r11=153(y), r12=54(width), r13=65(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 168
LDI r2, 93
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 88
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 360
LDI r11, 153
LDI r12, 54
LDI r13, 65
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
