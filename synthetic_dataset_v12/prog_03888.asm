; DESCRIPTION: Composite: Creates a cyan circular shape at (169, 77) with radius 54 then Renders a green box of size 66x94 starting at (400, 111) then Sets a single cyan pixel at (203, 108).
; PLAN: r0=169(x), r1=77(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=111(y), r7=66(width), r8=94(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=203(x), r11=108(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 77
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 111
LDI r7, 66
LDI r8, 94
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 108
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
