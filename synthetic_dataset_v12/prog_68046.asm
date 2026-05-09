; DESCRIPTION: Composite: Creates a magenta rectangular region at (224, 98) spanning 47 by 81 pixels then Places a orange dot at position (413, 236) then Places a red line segment connecting (13, 223) to (452, 115).
; PLAN: r0=224(x), r1=98(y), r2=47(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=236(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=13(x1), r11=223(y1), r12=452(x2), r13=115(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 224
LDI r1, 98
LDI r2, 47
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 236
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 13
LDI r11, 223
LDI r12, 452
LDI r13, 115
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
