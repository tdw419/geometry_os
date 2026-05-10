; DESCRIPTION: Composite: Renders a black line between points (332, 49) and (181, 92) then Renders a magenta box of size 99x15 starting at (20, 164).
; PLAN: r0=332(x1), r1=49(y1), r2=181(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=164(y), r7=99(width), r8=15(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 49
LDI r2, 181
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 164
LDI r7, 99
LDI r8, 15
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
