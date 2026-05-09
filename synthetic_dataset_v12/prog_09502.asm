; DESCRIPTION: Composite: Draws a green rectangle at (56, 134) with width 116 and height 19 then Places a cyan dot at position (260, 159) then Draws a white line from (479, 135) to (200, 30).
; PLAN: r0=56(x), r1=134(y), r2=116(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=159(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=479(x1), r11=135(y1), r12=200(x2), r13=30(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 134
LDI r2, 116
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 159
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 479
LDI r11, 135
LDI r12, 200
LDI r13, 30
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
