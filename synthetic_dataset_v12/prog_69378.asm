; DESCRIPTION: Composite: Sets a single white pixel at (66, 17) then Places a red line segment connecting (326, 34) to (348, 251) then Renders a red box of size 81x47 starting at (125, 59).
; PLAN: r0=66(x), r1=17(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=326(x1), r6=34(y1), r7=348(x2), r8=251(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=125(x), r11=59(y), r12=81(width), r13=47(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 17
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 326
LDI r6, 34
LDI r7, 348
LDI r8, 251
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 59
LDI r12, 81
LDI r13, 47
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
