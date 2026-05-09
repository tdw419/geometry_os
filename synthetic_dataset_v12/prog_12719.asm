; DESCRIPTION: Composite: Places a magenta dot at position (263, 220) then Draws a red circle centered at (305, 55) with radius 48 then Creates a magenta rectangular region at (99, 118) spanning 95 by 85 pixels.
; PLAN: r0=263(x), r1=220(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=55(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x), r11=118(y), r12=95(width), r13=85(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 220
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 55
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 118
LDI r12, 95
LDI r13, 85
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
