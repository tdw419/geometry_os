; DESCRIPTION: Composite: Renders a white box of size 53x102 starting at (37, 2) then Sets a single blue pixel at (208, 58) then Draws a white line from (233, 35) to (365, 37).
; PLAN: r0=37(x), r1=2(y), r2=53(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=58(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=233(x1), r11=35(y1), r12=365(x2), r13=37(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 37
LDI r1, 2
LDI r2, 53
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 58
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 233
LDI r11, 35
LDI r12, 365
LDI r13, 37
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
