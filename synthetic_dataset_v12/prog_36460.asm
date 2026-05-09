; DESCRIPTION: Composite: Creates a white rectangular region at (210, 9) spanning 48 by 32 pixels then Renders a purple line between points (319, 235) and (101, 2) then Sets a single white pixel at (124, 156).
; PLAN: r0=210(x), r1=9(y), r2=48(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x1), r6=235(y1), r7=101(x2), r8=2(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=124(x), r11=156(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 210
LDI r1, 9
LDI r2, 48
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 235
LDI r7, 101
LDI r8, 2
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 156
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
