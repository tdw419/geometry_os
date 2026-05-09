; DESCRIPTION: Composite: Renders a green box of size 43x69 starting at (190, 80) then Places a cyan line segment connecting (98, 136) to (57, 94).
; PLAN: r0=190(x), r1=80(y), r2=43(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x1), r6=136(y1), r7=57(x2), r8=94(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 80
LDI r2, 43
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 136
LDI r7, 57
LDI r8, 94
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
