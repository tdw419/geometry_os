; DESCRIPTION: Composite: Places a white dot at position (330, 107) then Places a orange line segment connecting (434, 233) to (0, 115) then Creates a orange rectangular region at (27, 213) spanning 69 by 16 pixels.
; PLAN: r0=330(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=434(x1), r6=233(y1), r7=0(x2), r8=115(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=27(x), r11=213(y), r12=69(width), r13=16(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 107
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 434
LDI r6, 233
LDI r7, 0
LDI r8, 115
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 213
LDI r12, 69
LDI r13, 16
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
