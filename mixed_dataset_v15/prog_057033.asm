; DESCRIPTION: Composite: Sets a single white pixel at (210, 118) then Places a red 90x112 rectangle at position (80, 14) then Renders a yellow line between points (461, 14) and (242, 191).
; PLAN: r0=210(x), r1=118(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=14(y), r7=90(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=461(x1), r11=14(y1), r12=242(x2), r13=191(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 118
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 80
LDI r6, 14
LDI r7, 90
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 461
LDI r11, 14
LDI r12, 242
LDI r13, 191
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
