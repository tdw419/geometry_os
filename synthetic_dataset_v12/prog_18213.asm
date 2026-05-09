; DESCRIPTION: Composite: Creates a red circular shape at (357, 122) with radius 79 then Renders a purple box of size 41x35 starting at (102, 150).
; PLAN: r0=357(x), r1=122(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=150(y), r7=41(width), r8=35(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 122
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 150
LDI r7, 41
LDI r8, 35
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
