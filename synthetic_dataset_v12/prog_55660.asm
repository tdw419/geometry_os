; DESCRIPTION: Composite: Creates a magenta rectangular region at (433, 54) spanning 25 by 105 pixels then Places a green line segment connecting (460, 122) to (236, 5).
; PLAN: r0=433(x), r1=54(y), r2=25(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x1), r6=122(y1), r7=236(x2), r8=5(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 54
LDI r2, 25
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 122
LDI r7, 236
LDI r8, 5
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
