; DESCRIPTION: Composite: Sets a single black pixel at (245, 116) then Creates a cyan rectangular region at (70, 146) spanning 30 by 11 pixels then Places a green circle of radius 38 at center (170, 80).
; PLAN: r0=245(x), r1=116(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=70(x), r6=146(y), r7=30(width), r8=11(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=170(x), r11=80(y), r12=38(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 116
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 70
LDI r6, 146
LDI r7, 30
LDI r8, 11
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 80
LDI r12, 38
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
