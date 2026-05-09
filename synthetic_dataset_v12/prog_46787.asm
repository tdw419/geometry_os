; DESCRIPTION: Composite: Sets a single green pixel at (506, 215) then Places a red 92x10 rectangle at position (155, 59) then Renders a green line between points (9, 55) and (100, 203).
; PLAN: r0=506(x), r1=215(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=59(y), r7=92(width), r8=10(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=9(x1), r11=55(y1), r12=100(x2), r13=203(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 506
LDI r1, 215
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 155
LDI r6, 59
LDI r7, 92
LDI r8, 10
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 9
LDI r11, 55
LDI r12, 100
LDI r13, 203
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
