; DESCRIPTION: Composite: Sets a single cyan pixel at (53, 240) then Renders a cyan line between points (126, 180) and (194, 37) then Creates a blue rectangular region at (34, 28) spanning 100 by 79 pixels.
; PLAN: r0=53(x), r1=240(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=126(x1), r6=180(y1), r7=194(x2), r8=37(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=34(x), r11=28(y), r12=100(width), r13=79(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 240
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 126
LDI r6, 180
LDI r7, 194
LDI r8, 37
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 28
LDI r12, 100
LDI r13, 79
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
