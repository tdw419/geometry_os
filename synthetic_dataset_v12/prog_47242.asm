; DESCRIPTION: Composite: Places a white dot at position (240, 33) then Places a red line segment connecting (295, 99) to (433, 6) then Renders a orange box of size 63x81 starting at (26, 142).
; PLAN: r0=240(x), r1=33(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=295(x1), r6=99(y1), r7=433(x2), r8=6(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=26(x), r11=142(y), r12=63(width), r13=81(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 33
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 295
LDI r6, 99
LDI r7, 433
LDI r8, 6
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 142
LDI r12, 63
LDI r13, 81
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
