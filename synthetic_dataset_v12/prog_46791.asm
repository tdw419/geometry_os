; DESCRIPTION: Composite: Renders a orange box of size 77x100 starting at (48, 154) then Renders a magenta line between points (375, 119) and (466, 211) then Sets a single green pixel at (458, 31).
; PLAN: r0=48(x), r1=154(y), r2=77(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x1), r6=119(y1), r7=466(x2), r8=211(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=458(x), r11=31(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 48
LDI r1, 154
LDI r2, 77
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 119
LDI r7, 466
LDI r8, 211
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 31
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
