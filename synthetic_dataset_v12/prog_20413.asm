; DESCRIPTION: Composite: Sets a single green pixel at (318, 184) then Places a blue 92x76 rectangle at position (233, 4) then Places a green line segment connecting (149, 159) to (305, 93).
; PLAN: r0=318(x), r1=184(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=233(x), r6=4(y), r7=92(width), r8=76(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=149(x1), r11=159(y1), r12=305(x2), r13=93(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 184
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 233
LDI r6, 4
LDI r7, 92
LDI r8, 76
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 159
LDI r12, 305
LDI r13, 93
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
