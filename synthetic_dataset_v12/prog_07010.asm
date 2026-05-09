; DESCRIPTION: Composite: Places a white dot at position (173, 149) then Renders a blue line between points (149, 177) and (118, 100) then Renders a white box of size 26x113 starting at (41, 83).
; PLAN: r0=173(x), r1=149(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=149(x1), r6=177(y1), r7=118(x2), r8=100(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=41(x), r11=83(y), r12=26(width), r13=113(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 149
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 149
LDI r6, 177
LDI r7, 118
LDI r8, 100
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 41
LDI r11, 83
LDI r12, 26
LDI r13, 113
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
