; DESCRIPTION: Composite: Sets a single purple pixel at (282, 154) then Renders a yellow box of size 107x81 starting at (252, 130) then Places a red line segment connecting (450, 110) to (111, 21).
; PLAN: r0=282(x), r1=154(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=130(y), r7=107(width), r8=81(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=450(x1), r11=110(y1), r12=111(x2), r13=21(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 154
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 130
LDI r7, 107
LDI r8, 81
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 450
LDI r11, 110
LDI r12, 111
LDI r13, 21
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
