; DESCRIPTION: Composite: Renders a white line between points (96, 30) and (107, 80) then Creates a cyan rectangular region at (55, 175) spanning 34 by 80 pixels.
; PLAN: r0=96(x1), r1=30(y1), r2=107(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=175(y), r7=34(width), r8=80(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 30
LDI r2, 107
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 175
LDI r7, 34
LDI r8, 80
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
