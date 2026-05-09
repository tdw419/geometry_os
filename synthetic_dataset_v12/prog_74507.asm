; DESCRIPTION: Composite: Creates a white rectangular region at (273, 93) spanning 111 by 107 pixels then Places a red circle of radius 64 at center (84, 183) then Renders a white line between points (34, 226) and (184, 29).
; PLAN: r0=273(x), r1=93(y), r2=111(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x), r6=183(y), r7=64(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=34(x1), r11=226(y1), r12=184(x2), r13=29(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 93
LDI r2, 111
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 183
LDI r7, 64
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 34
LDI r11, 226
LDI r12, 184
LDI r13, 29
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
