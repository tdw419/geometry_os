; DESCRIPTION: Composite: Places a cyan dot at position (219, 125) then Places a white line segment connecting (2, 6) to (154, 173) then Places a green 27x83 rectangle at position (163, 163).
; PLAN: r0=219(x), r1=125(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=2(x1), r6=6(y1), r7=154(x2), r8=173(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=163(x), r11=163(y), r12=27(width), r13=83(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 219
LDI r1, 125
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 2
LDI r6, 6
LDI r7, 154
LDI r8, 173
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 163
LDI r11, 163
LDI r12, 27
LDI r13, 83
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
