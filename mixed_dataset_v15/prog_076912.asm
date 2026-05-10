; DESCRIPTION: Composite: Draws a white rectangle at (73, 129) with width 100 and height 78 then Places a yellow line segment connecting (169, 205) to (458, 141).
; PLAN: r0=73(x), r1=129(y), r2=100(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x1), r6=205(y1), r7=458(x2), r8=141(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 129
LDI r2, 100
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 205
LDI r7, 458
LDI r8, 141
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
