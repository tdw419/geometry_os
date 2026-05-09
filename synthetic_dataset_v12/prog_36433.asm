; DESCRIPTION: Composite: Places a white line segment connecting (501, 26) to (16, 155) then Renders a magenta box of size 119x102 starting at (196, 14) then Sets a single white pixel at (346, 255).
; PLAN: r0=501(x1), r1=26(y1), r2=16(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=14(y), r7=119(width), r8=102(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x), r11=255(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 501
LDI r1, 26
LDI r2, 16
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 14
LDI r7, 119
LDI r8, 102
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 255
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
