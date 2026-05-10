; DESCRIPTION: Composite: Sets a single cyan pixel at (55, 118) then Renders a cyan disk with center (167, 113) and radius 54 then Renders a white box of size 40x95 starting at (96, 83).
; PLAN: r0=55(x), r1=118(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=167(x), r6=113(y), r7=54(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=96(x), r11=83(y), r12=40(width), r13=95(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 118
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 167
LDI r6, 113
LDI r7, 54
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 96
LDI r11, 83
LDI r12, 40
LDI r13, 95
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
