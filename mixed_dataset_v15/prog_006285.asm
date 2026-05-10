; DESCRIPTION: Composite: Draws a white line from (500, 251) to (336, 102) then Places a cyan dot at position (182, 185) then Places a magenta 102x115 rectangle at position (266, 88).
; PLAN: r0=500(x1), r1=251(y1), r2=336(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=185(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=266(x), r11=88(y), r12=102(width), r13=115(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 500
LDI r1, 251
LDI r2, 336
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 185
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 266
LDI r11, 88
LDI r12, 102
LDI r13, 115
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
