; DESCRIPTION: Composite: Sets a single magenta pixel at (182, 242) then Places a red line segment connecting (491, 246) to (211, 112) then Renders a green box of size 117x75 starting at (96, 80).
; PLAN: r0=182(x), r1=242(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=491(x1), r6=246(y1), r7=211(x2), r8=112(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=96(x), r11=80(y), r12=117(width), r13=75(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 242
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 491
LDI r6, 246
LDI r7, 211
LDI r8, 112
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 80
LDI r12, 117
LDI r13, 75
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
