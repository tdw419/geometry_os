; DESCRIPTION: Composite: Creates a purple rectangular region at (320, 146) spanning 25 by 57 pixels then Places a green line segment connecting (30, 154) to (276, 134).
; PLAN: r0=320(x), r1=146(y), r2=25(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=30(x1), r6=154(y1), r7=276(x2), r8=134(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 146
LDI r2, 25
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 154
LDI r7, 276
LDI r8, 134
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
