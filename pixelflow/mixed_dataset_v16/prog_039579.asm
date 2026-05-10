; DESCRIPTION: Composite: Sets a single white pixel at (292, 196) then Renders a purple box of size 117x26 starting at (109, 52) then Places a orange line segment connecting (237, 137) to (321, 243).
; PLAN: r0=292(x), r1=196(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=109(x), r6=52(y), r7=117(width), r8=26(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=237(x1), r11=137(y1), r12=321(x2), r13=243(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 196
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 109
LDI r6, 52
LDI r7, 117
LDI r8, 26
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 137
LDI r12, 321
LDI r13, 243
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
