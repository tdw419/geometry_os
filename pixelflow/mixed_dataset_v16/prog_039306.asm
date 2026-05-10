; DESCRIPTION: Composite: Renders a blue box of size 42x53 starting at (357, 68) then Renders a purple line between points (280, 224) and (430, 180).
; PLAN: r0=357(x), r1=68(y), r2=42(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x1), r6=224(y1), r7=430(x2), r8=180(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 68
LDI r2, 42
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 224
LDI r7, 430
LDI r8, 180
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
