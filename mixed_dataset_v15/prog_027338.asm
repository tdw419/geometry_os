; DESCRIPTION: Composite: Places a red 35x25 rectangle at position (72, 29) then Places a red line segment connecting (222, 184) to (165, 195).
; PLAN: r0=72(x), r1=29(y), r2=35(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x1), r6=184(y1), r7=165(x2), r8=195(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 29
LDI r2, 35
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 184
LDI r7, 165
LDI r8, 195
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
