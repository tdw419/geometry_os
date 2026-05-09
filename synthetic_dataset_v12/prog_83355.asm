; DESCRIPTION: Composite: Creates a red rectangular region at (354, 121) spanning 115 by 39 pixels then Sets a single purple pixel at (30, 212) then Places a green line segment connecting (134, 172) to (129, 198).
; PLAN: r0=354(x), r1=121(y), r2=115(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=30(x), r6=212(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=134(x1), r11=172(y1), r12=129(x2), r13=198(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 121
LDI r2, 115
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 212
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 134
LDI r11, 172
LDI r12, 129
LDI r13, 198
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
