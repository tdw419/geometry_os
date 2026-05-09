; DESCRIPTION: Composite: Sets a single magenta pixel at (343, 192) then Renders a white line between points (310, 168) and (193, 110) then Creates a black rectangular region at (247, 106) spanning 10 by 54 pixels.
; PLAN: r0=343(x), r1=192(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=310(x1), r6=168(y1), r7=193(x2), r8=110(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=106(y), r12=10(width), r13=54(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 343
LDI r1, 192
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 310
LDI r6, 168
LDI r7, 193
LDI r8, 110
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 106
LDI r12, 10
LDI r13, 54
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
