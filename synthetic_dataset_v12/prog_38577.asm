; DESCRIPTION: Composite: Sets a single green pixel at (239, 194) then Renders a magenta box of size 41x25 starting at (325, 172) then Renders a red line between points (265, 200) and (504, 170).
; PLAN: r0=239(x), r1=194(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=172(y), r7=41(width), r8=25(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=265(x1), r11=200(y1), r12=504(x2), r13=170(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 194
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 325
LDI r6, 172
LDI r7, 41
LDI r8, 25
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 200
LDI r12, 504
LDI r13, 170
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
