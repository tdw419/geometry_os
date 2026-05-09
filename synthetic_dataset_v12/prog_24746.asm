; DESCRIPTION: Composite: Places a black line segment connecting (195, 203) to (435, 98) then Renders a cyan box of size 82x20 starting at (335, 130).
; PLAN: r0=195(x1), r1=203(y1), r2=435(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=130(y), r7=82(width), r8=20(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 203
LDI r2, 435
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 130
LDI r7, 82
LDI r8, 20
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
