; DESCRIPTION: Composite: Sets a single orange pixel at (175, 47) then Places a orange line segment connecting (428, 250) to (324, 241) then Renders a magenta box of size 82x64 starting at (211, 34).
; PLAN: r0=175(x), r1=47(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=428(x1), r6=250(y1), r7=324(x2), r8=241(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=211(x), r11=34(y), r12=82(width), r13=64(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 175
LDI r1, 47
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 428
LDI r6, 250
LDI r7, 324
LDI r8, 241
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 34
LDI r12, 82
LDI r13, 64
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
