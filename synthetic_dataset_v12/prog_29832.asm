; DESCRIPTION: Composite: Sets a single green pixel at (345, 205) then Draws a magenta rectangle at (33, 74) with width 112 and height 115 then Renders a blue disk with center (177, 48) and radius 46.
; PLAN: r0=345(x), r1=205(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=74(y), r7=112(width), r8=115(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=177(x), r11=48(y), r12=46(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 345
LDI r1, 205
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 33
LDI r6, 74
LDI r7, 112
LDI r8, 115
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 48
LDI r12, 46
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
