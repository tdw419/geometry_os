; DESCRIPTION: Composite: Draws a cyan line from (397, 54) to (112, 238) then Creates a white rectangular region at (70, 85) spanning 12 by 97 pixels then Places a white circle of radius 34 at center (475, 87).
; PLAN: r0=397(x1), r1=54(y1), r2=112(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=85(y), r7=12(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=475(x), r11=87(y), r12=34(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 397
LDI r1, 54
LDI r2, 112
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 85
LDI r7, 12
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 475
LDI r11, 87
LDI r12, 34
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
