; DESCRIPTION: Composite: Renders a red box of size 38x38 starting at (350, 30) then Renders a magenta line between points (375, 4) and (233, 20).
; PLAN: r0=350(x), r1=30(y), r2=38(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x1), r6=4(y1), r7=233(x2), r8=20(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 30
LDI r2, 38
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 4
LDI r7, 233
LDI r8, 20
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
