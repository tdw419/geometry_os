; DESCRIPTION: Composite: Places a orange dot at position (466, 121) then Renders a red disk with center (219, 90) and radius 77 then Places a cyan line segment connecting (504, 1) to (251, 189).
; PLAN: r0=466(x), r1=121(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=90(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=504(x1), r11=1(y1), r12=251(x2), r13=189(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 121
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 219
LDI r6, 90
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 504
LDI r11, 1
LDI r12, 251
LDI r13, 189
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
