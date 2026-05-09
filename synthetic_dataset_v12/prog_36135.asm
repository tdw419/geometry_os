; DESCRIPTION: Composite: Places a cyan circle of radius 14 at center (138, 173) then Places a orange 33x89 rectangle at position (174, 35) then Renders a blue line between points (214, 212) and (449, 241).
; PLAN: r0=138(x), r1=173(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x), r6=35(y), r7=33(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=214(x1), r11=212(y1), r12=449(x2), r13=241(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 173
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 35
LDI r7, 33
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 212
LDI r12, 449
LDI r13, 241
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
