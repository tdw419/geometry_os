; DESCRIPTION: Composite: Creates a orange rectangular region at (132, 86) spanning 55 by 38 pixels then Places a cyan line segment connecting (341, 99) to (115, 148).
; PLAN: r0=132(x), r1=86(y), r2=55(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x1), r6=99(y1), r7=115(x2), r8=148(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 86
LDI r2, 55
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 99
LDI r7, 115
LDI r8, 148
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
