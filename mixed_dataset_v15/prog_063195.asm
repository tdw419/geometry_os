; DESCRIPTION: Composite: Renders a green box of size 120x23 starting at (357, 0) then Renders a yellow line between points (502, 205) and (78, 173) then Places a yellow dot at position (194, 3).
; PLAN: r0=357(x), r1=0(y), r2=120(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=502(x1), r6=205(y1), r7=78(x2), r8=173(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=3(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 357
LDI r1, 0
LDI r2, 120
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 205
LDI r7, 78
LDI r8, 173
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 3
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
