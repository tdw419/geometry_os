; DESCRIPTION: Composite: Places a black line segment connecting (29, 27) to (264, 75) then Renders a black box of size 84x14 starting at (96, 126).
; PLAN: r0=29(x1), r1=27(y1), r2=264(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=126(y), r7=84(width), r8=14(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 29
LDI r1, 27
LDI r2, 264
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 126
LDI r7, 84
LDI r8, 14
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
