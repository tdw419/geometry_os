; DESCRIPTION: Composite: Places a orange 37x48 rectangle at position (62, 119) then Places a red dot at position (150, 196) then Draws a cyan line from (178, 174) to (138, 23).
; PLAN: r0=62(x), r1=119(y), r2=37(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x), r6=196(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=178(x1), r11=174(y1), r12=138(x2), r13=23(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 119
LDI r2, 37
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 196
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 178
LDI r11, 174
LDI r12, 138
LDI r13, 23
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
