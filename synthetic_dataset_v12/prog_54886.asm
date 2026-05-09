; DESCRIPTION: Composite: Creates a red rectangular region at (282, 120) spanning 43 by 36 pixels then Places a white line segment connecting (379, 68) to (98, 116) then Places a blue dot at position (484, 23).
; PLAN: r0=282(x), r1=120(y), r2=43(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x1), r6=68(y1), r7=98(x2), r8=116(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=484(x), r11=23(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 282
LDI r1, 120
LDI r2, 43
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 68
LDI r7, 98
LDI r8, 116
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 23
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
