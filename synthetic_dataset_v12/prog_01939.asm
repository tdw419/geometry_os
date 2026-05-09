; DESCRIPTION: Composite: Renders a green disk with center (216, 54) and radius 27 then Renders a orange box of size 88x36 starting at (130, 50) then Sets a single red pixel at (333, 235).
; PLAN: r0=216(x), r1=54(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x), r6=50(y), r7=88(width), r8=36(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=333(x), r11=235(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 216
LDI r1, 54
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 50
LDI r7, 88
LDI r8, 36
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 235
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
