; DESCRIPTION: Composite: Places a black dot at position (158, 113) then Places a cyan line segment connecting (502, 6) to (449, 93) then Creates a black rectangular region at (435, 100) spanning 33 by 109 pixels.
; PLAN: r0=158(x), r1=113(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=502(x1), r6=6(y1), r7=449(x2), r8=93(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=100(y), r12=33(width), r13=109(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 113
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 502
LDI r6, 6
LDI r7, 449
LDI r8, 93
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 100
LDI r12, 33
LDI r13, 109
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
