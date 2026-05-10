; DESCRIPTION: Composite: Sets a single magenta pixel at (228, 89) then Renders a magenta line between points (97, 150) and (452, 177) then Renders a red box of size 45x87 starting at (213, 70).
; PLAN: r0=228(x), r1=89(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=97(x1), r6=150(y1), r7=452(x2), r8=177(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=213(x), r11=70(y), r12=45(width), r13=87(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 89
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 97
LDI r6, 150
LDI r7, 452
LDI r8, 177
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 70
LDI r12, 45
LDI r13, 87
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
