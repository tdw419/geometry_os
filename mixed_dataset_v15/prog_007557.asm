; DESCRIPTION: Composite: Places a blue line segment connecting (250, 11) to (96, 184) then Places a magenta dot at position (449, 61) then Creates a orange rectangular region at (176, 152) spanning 115 by 73 pixels.
; PLAN: r0=250(x1), r1=11(y1), r2=96(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=61(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=176(x), r11=152(y), r12=115(width), r13=73(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 11
LDI r2, 96
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 61
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 176
LDI r11, 152
LDI r12, 115
LDI r13, 73
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
