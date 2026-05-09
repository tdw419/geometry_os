; DESCRIPTION: Composite: Places a orange circle of radius 35 at center (382, 66) then Renders a cyan line between points (285, 157) and (37, 55) then Renders a magenta box of size 83x105 starting at (327, 57).
; PLAN: r0=382(x), r1=66(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x1), r6=157(y1), r7=37(x2), r8=55(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=327(x), r11=57(y), r12=83(width), r13=105(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 66
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 157
LDI r7, 37
LDI r8, 55
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 57
LDI r12, 83
LDI r13, 105
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
