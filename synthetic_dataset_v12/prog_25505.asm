; DESCRIPTION: Composite: Renders a white line between points (471, 47) and (429, 149) then Sets a single red pixel at (405, 112) then Draws a red rectangle at (33, 126) with width 115 and height 81.
; PLAN: r0=471(x1), r1=47(y1), r2=429(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=112(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=33(x), r11=126(y), r12=115(width), r13=81(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 47
LDI r2, 429
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 112
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 33
LDI r11, 126
LDI r12, 115
LDI r13, 81
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
