; DESCRIPTION: Composite: Sets a single magenta pixel at (100, 213) then Renders a magenta box of size 65x119 starting at (286, 58) then Draws a yellow line from (354, 203) to (76, 236).
; PLAN: r0=100(x), r1=213(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=286(x), r6=58(y), r7=65(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=354(x1), r11=203(y1), r12=76(x2), r13=236(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 213
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 286
LDI r6, 58
LDI r7, 65
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 203
LDI r12, 76
LDI r13, 236
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
