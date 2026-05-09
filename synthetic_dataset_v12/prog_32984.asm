; DESCRIPTION: Composite: Creates a black rectangular region at (272, 84) spanning 69 by 103 pixels then Places a blue line segment connecting (189, 168) to (165, 71).
; PLAN: r0=272(x), r1=84(y), r2=69(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x1), r6=168(y1), r7=165(x2), r8=71(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 84
LDI r2, 69
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 168
LDI r7, 165
LDI r8, 71
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
