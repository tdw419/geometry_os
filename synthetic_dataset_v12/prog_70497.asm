; DESCRIPTION: Composite: Sets a single black pixel at (295, 173) then Renders a orange box of size 48x77 starting at (102, 151) then Renders a red disk with center (171, 91) and radius 35.
; PLAN: r0=295(x), r1=173(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=151(y), r7=48(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=171(x), r11=91(y), r12=35(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 295
LDI r1, 173
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 102
LDI r6, 151
LDI r7, 48
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 91
LDI r12, 35
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
