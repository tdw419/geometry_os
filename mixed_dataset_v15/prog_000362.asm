; DESCRIPTION: Composite: Sets a single white pixel at (420, 112) then Creates a green rectangular region at (279, 108) spanning 35 by 98 pixels then Places a magenta line segment connecting (82, 203) to (478, 141).
; PLAN: r0=420(x), r1=112(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=279(x), r6=108(y), r7=35(width), r8=98(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=82(x1), r11=203(y1), r12=478(x2), r13=141(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 420
LDI r1, 112
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 279
LDI r6, 108
LDI r7, 35
LDI r8, 98
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 203
LDI r12, 478
LDI r13, 141
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
