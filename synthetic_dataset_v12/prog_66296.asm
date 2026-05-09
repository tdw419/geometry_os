; DESCRIPTION: Composite: Places a magenta dot at position (407, 38) then Renders a green line between points (434, 55) and (397, 200) then Creates a purple rectangular region at (360, 159) spanning 86 by 94 pixels.
; PLAN: r0=407(x), r1=38(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=434(x1), r6=55(y1), r7=397(x2), r8=200(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=159(y), r12=86(width), r13=94(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 38
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 434
LDI r6, 55
LDI r7, 397
LDI r8, 200
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 159
LDI r12, 86
LDI r13, 94
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
