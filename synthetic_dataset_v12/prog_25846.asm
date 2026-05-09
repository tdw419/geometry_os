; DESCRIPTION: Composite: Creates a red rectangular region at (89, 120) spanning 89 by 113 pixels then Places a yellow dot at position (338, 223) then Renders a yellow line between points (300, 249) and (56, 165).
; PLAN: r0=89(x), r1=120(y), r2=89(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x), r6=223(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=300(x1), r11=249(y1), r12=56(x2), r13=165(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 120
LDI r2, 89
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 223
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 300
LDI r11, 249
LDI r12, 56
LDI r13, 165
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
