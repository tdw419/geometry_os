; DESCRIPTION: Composite: Renders a black line between points (50, 17) and (356, 199) then Creates a cyan rectangular region at (255, 23) spanning 40 by 74 pixels.
; PLAN: r0=50(x1), r1=17(y1), r2=356(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=23(y), r7=40(width), r8=74(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 17
LDI r2, 356
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 23
LDI r7, 40
LDI r8, 74
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
