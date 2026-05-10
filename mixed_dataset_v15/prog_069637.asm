; DESCRIPTION: Composite: Renders a red box of size 41x110 starting at (223, 99) then Places a black line segment connecting (221, 102) to (280, 232).
; PLAN: r0=223(x), r1=99(y), r2=41(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x1), r6=102(y1), r7=280(x2), r8=232(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 99
LDI r2, 41
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 102
LDI r7, 280
LDI r8, 232
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
