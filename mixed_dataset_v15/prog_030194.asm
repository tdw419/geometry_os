; DESCRIPTION: Composite: Renders a white box of size 70x21 starting at (153, 225) then Places a magenta dot at position (407, 93) then Places a green line segment connecting (326, 97) to (259, 76).
; PLAN: r0=153(x), r1=225(y), r2=70(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=93(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=326(x1), r11=97(y1), r12=259(x2), r13=76(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 225
LDI r2, 70
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 93
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 326
LDI r11, 97
LDI r12, 259
LDI r13, 76
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
