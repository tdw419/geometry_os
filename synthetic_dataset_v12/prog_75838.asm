; DESCRIPTION: Composite: Sets a single yellow pixel at (131, 19) then Renders a yellow box of size 98x80 starting at (41, 60) then Renders a purple disk with center (262, 229) and radius 26.
; PLAN: r0=131(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=60(y), r7=98(width), r8=80(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=262(x), r11=229(y), r12=26(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 19
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 41
LDI r6, 60
LDI r7, 98
LDI r8, 80
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 229
LDI r12, 26
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
