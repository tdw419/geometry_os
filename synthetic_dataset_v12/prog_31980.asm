; DESCRIPTION: Composite: Places a yellow line segment connecting (256, 93) to (246, 122) then Sets a single purple pixel at (28, 102) then Renders a purple box of size 59x63 starting at (79, 143).
; PLAN: r0=256(x1), r1=93(y1), r2=246(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=28(x), r6=102(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=79(x), r11=143(y), r12=59(width), r13=63(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 93
LDI r2, 246
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 102
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 79
LDI r11, 143
LDI r12, 59
LDI r13, 63
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
