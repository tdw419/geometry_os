; DESCRIPTION: Composite: Draws a cyan rectangle at (288, 32) with width 95 and height 22 then Places a orange dot at position (210, 119) then Renders a red line between points (419, 69) and (508, 55).
; PLAN: r0=288(x), r1=32(y), r2=95(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=119(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=419(x1), r11=69(y1), r12=508(x2), r13=55(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 32
LDI r2, 95
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 119
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 419
LDI r11, 69
LDI r12, 508
LDI r13, 55
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
