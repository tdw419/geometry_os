; DESCRIPTION: Composite: Draws a blue circle centered at (50, 131) with radius 10 then Draws a cyan line from (159, 244) to (184, 211) then Places a cyan 93x115 rectangle at position (317, 62).
; PLAN: r0=50(x), r1=131(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x1), r6=244(y1), r7=184(x2), r8=211(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=317(x), r11=62(y), r12=93(width), r13=115(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 131
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 244
LDI r7, 184
LDI r8, 211
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 62
LDI r12, 93
LDI r13, 115
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
