; DESCRIPTION: Composite: Renders a purple line between points (274, 54) and (150, 194) then Renders a yellow box of size 67x62 starting at (91, 129) then Places a yellow dot at position (335, 210).
; PLAN: r0=274(x1), r1=54(y1), r2=150(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=129(y), r7=67(width), r8=62(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=335(x), r11=210(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 274
LDI r1, 54
LDI r2, 150
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 129
LDI r7, 67
LDI r8, 62
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 210
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
