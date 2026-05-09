; DESCRIPTION: Composite: Places a yellow line segment connecting (212, 247) to (435, 98) then Renders a cyan box of size 32x19 starting at (350, 54) then Places a orange dot at position (177, 227).
; PLAN: r0=212(x1), r1=247(y1), r2=435(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=54(y), r7=32(width), r8=19(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=177(x), r11=227(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 212
LDI r1, 247
LDI r2, 435
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 54
LDI r7, 32
LDI r8, 19
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 227
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
