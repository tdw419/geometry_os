; DESCRIPTION: Composite: Creates a yellow rectangular region at (100, 64) spanning 113 by 115 pixels then Places a magenta line segment connecting (310, 233) to (156, 83).
; PLAN: r0=100(x), r1=64(y), r2=113(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x1), r6=233(y1), r7=156(x2), r8=83(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 64
LDI r2, 113
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 233
LDI r7, 156
LDI r8, 83
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
