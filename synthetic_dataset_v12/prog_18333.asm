; DESCRIPTION: Composite: Places a magenta dot at position (200, 80) then Renders a red disk with center (427, 154) and radius 70 then Renders a orange line between points (182, 171) and (276, 246).
; PLAN: r0=200(x), r1=80(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=154(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=182(x1), r11=171(y1), r12=276(x2), r13=246(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 80
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 427
LDI r6, 154
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 182
LDI r11, 171
LDI r12, 276
LDI r13, 246
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
