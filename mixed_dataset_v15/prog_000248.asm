; DESCRIPTION: Composite: Sets a single blue pixel at (458, 62) then Draws a cyan rectangle at (130, 129) with width 26 and height 26 then Places a black line segment connecting (37, 149) to (69, 71).
; PLAN: r0=458(x), r1=62(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=129(y), r7=26(width), r8=26(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=37(x1), r11=149(y1), r12=69(x2), r13=71(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 458
LDI r1, 62
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 130
LDI r6, 129
LDI r7, 26
LDI r8, 26
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 149
LDI r12, 69
LDI r13, 71
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
