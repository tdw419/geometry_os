; DESCRIPTION: Composite: Places a black dot at position (105, 94) then Places a cyan 56x35 rectangle at position (183, 166) then Renders a orange line between points (115, 203) and (410, 36).
; PLAN: r0=105(x), r1=94(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=166(y), r7=56(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=115(x1), r11=203(y1), r12=410(x2), r13=36(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 94
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 183
LDI r6, 166
LDI r7, 56
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 203
LDI r12, 410
LDI r13, 36
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
