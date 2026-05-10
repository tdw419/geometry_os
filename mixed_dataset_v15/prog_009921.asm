; DESCRIPTION: Composite: Draws a white line from (394, 54) to (366, 138) then Places a green 120x92 rectangle at position (167, 16) then Places a white circle of radius 35 at center (82, 179).
; PLAN: r0=394(x1), r1=54(y1), r2=366(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=16(y), r7=120(width), r8=92(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=82(x), r11=179(y), r12=35(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 394
LDI r1, 54
LDI r2, 366
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 16
LDI r7, 120
LDI r8, 92
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 179
LDI r12, 35
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
