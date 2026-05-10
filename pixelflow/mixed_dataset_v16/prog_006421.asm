; DESCRIPTION: Composite: Places a white 20x26 rectangle at position (479, 50) then Places a red dot at position (204, 215) then Places a red line segment connecting (230, 142) to (483, 133).
; PLAN: r0=479(x), r1=50(y), r2=20(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=215(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=230(x1), r11=142(y1), r12=483(x2), r13=133(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 479
LDI r1, 50
LDI r2, 20
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 215
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 230
LDI r11, 142
LDI r12, 483
LDI r13, 133
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
