; DESCRIPTION: Composite: Renders a magenta box of size 102x95 starting at (309, 140) then Sets a single blue pixel at (306, 194) then Places a cyan line segment connecting (135, 162) to (355, 95).
; PLAN: r0=309(x), r1=140(y), r2=102(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=194(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=135(x1), r11=162(y1), r12=355(x2), r13=95(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 140
LDI r2, 102
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 194
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 135
LDI r11, 162
LDI r12, 355
LDI r13, 95
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
